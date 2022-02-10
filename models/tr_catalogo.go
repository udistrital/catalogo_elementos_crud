package models

import (
	"encoding/json"
	"fmt"
	"strconv"

	"github.com/astaxie/beego/logs"
	"github.com/astaxie/beego/orm"
)

type NodoSubgrupo struct {
	Data       map[string]interface{}
	Expandible bool
}

// GetCatalogo Transacción para consultar el árbol de catálogo
func GetArbolCatalogo(catalogoId int, elementos bool, subgruposInactivos bool) (arbolCatalogo []map[string]interface{}, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(SubgrupoCatalogo)).RelatedSel().Filter("CatalogoId", catalogoId)

	if !subgruposInactivos {
		qs = qs.Filter("SubgrupoId__Activo", true)
	}

	var grupos []SubgrupoCatalogo
	if _, err := qs.All(&grupos, "SubgrupoId"); err == nil {
		for _, grupo := range grupos {
			data := make(map[string]interface{})
			data["data"] = grupo.SubgrupoId
			subgruposHijos := getSubgrupo(grupo.SubgrupoId.Id, elementos, subgruposInactivos)
			if len(subgruposHijos) > 0 {
				data["children"] = subgruposHijos
			}
			arbolCatalogo = append(arbolCatalogo, data)
		}

		return arbolCatalogo, nil
	}
	return nil, err
}

// getSubgrupo Transacción para consultar los subgrupos del árbol del catálogo
func getSubgrupo(subgrupoPadreID int, elementos bool, subgrupoInactivo bool) (arbolSubgrupo []map[string]interface{}) {
	var subgrupos []SubgrupoSubgrupo
	o := orm.NewOrm()
	qs := o.QueryTable(new(SubgrupoSubgrupo)).RelatedSel().Filter("SubgrupoPadreId", subgrupoPadreID)

	if !subgrupoInactivo {
		qs = qs.Filter("SubgrupoHijoId__Activo", true)
	}

	if _, err := qs.All(&subgrupos, "SubgrupoHijoId"); err == nil {

		for _, subgrupoHijo := range subgrupos {
			data := make(map[string]interface{})
			data["data"] = subgrupoHijo.SubgrupoHijoId

			if subgrupoHijo.SubgrupoHijoId.TipoNivelId.Id < 4 {
				subgruposHijos := getSubgrupo(subgrupoHijo.SubgrupoHijoId.Id, elementos, subgrupoInactivo)
				if len(subgruposHijos) > 0 {
					data["children"] = subgruposHijos
				}

			} else if elementos && subgrupoHijo.SubgrupoHijoId.TipoNivelId.Id == 4 {

				elementosHijos := getElementosByParent(subgrupoHijo.SubgrupoHijoId.Id)
				if len(elementosHijos) > 0 {
					data["children"] = elementosHijos
				}

			}

			arbolSubgrupo = append(arbolSubgrupo, data)
		}
	}

	return
}

func getElementosByParent(subgrupoId int) (elementos []map[string]interface{}) {
	query := make(map[string]string)
	query["SubgrupoId"] = strconv.Itoa(subgrupoId)
	listaElementos, _ := GetAllElemento(query, nil, nil, nil, 0, 0)

	if len(listaElementos) > 0 {
		for _, elemento := range listaElementos {
			child := make(map[string]interface{})
			child["data"] = elemento
			elementos = append(elementos, child)
		}
	}

	return
}

func GetSubgruposRelacionados(Tipo_Bien int) (Subgrupos []map[string]interface{}, err error) {
	o := orm.NewOrm()
	var subgrupos []DetalleSubgrupo
	var Subgrupos2 []map[string]interface{}
	if _, err := o.QueryTable(new(DetalleSubgrupo)).RelatedSel().Filter("TipoBienId", Tipo_Bien).Filter("Activo", true).All(&subgrupos); err == nil {
		fmt.Println(subgrupos)
		for _, subgrupoHijo := range subgrupos {

			logs.Debug(subgrupoHijo.SubgrupoId)
			data := make(map[string]interface{})
			// data["data"] = subgrupoHijo.SubgrupoId
			if subgrupoHijo.SubgrupoId.Activo == true {

				subgruposHijos := getSubgrupo(subgrupoHijo.SubgrupoId.Id, false, false)
				if len(subgruposHijos) > 0 {
					data["children"] = subgruposHijos
				}
				Subgrupos2 = append(Subgrupos2, data)
			}
		}
		Subgrupos = getSubgrupo2(Subgrupos2)
	}
	return
}

// getSubgrupo Transacción para consultar los subgrupos del árbol del catálogo
func getSubgrupo2(subgrupo_padre []map[string]interface{}) (Subgrupos []map[string]interface{}) {

	var data2 []map[string]interface{}
	var data4 map[string]interface{}
	var data3 []map[string]interface{}

	for _, subgrupos_hijos := range subgrupo_padre {
		if subgrupos_hijos["data"] != nil {

			if jsonString, err := json.Marshal(subgrupos_hijos["data"]); err == nil {
				if err2 := json.Unmarshal(jsonString, &data4); err2 == nil {
					Subgrupos = append(Subgrupos, map[string]interface{}{
						"Id":                data4["Id"],
						"Nombre":            data4["Nombre"],
						"Descripcion":       data4["Descripcion"],
						"FechaCreacion":     data4["FechaCreacion"],
						"FechaModificacion": data4["FechaModificacion"],
						"Activo":            data4["Activo"],
						"Codigo":            data4["Codigo"],
					})

				}
			}

		}

		if subgrupos_hijos["children"] != nil {

			if jsonString, err := json.Marshal(subgrupos_hijos["children"]); err == nil {
				if err2 := json.Unmarshal(jsonString, &data2); err2 == nil {

					data3 = getSubgrupo2(data2)
					for _, q := range data3 {
						Subgrupos = append(Subgrupos, map[string]interface{}{
							"Id":                q["Id"],
							"Nombre":            q["Nombre"],
							"Descripcion":       q["Descripcion"],
							"FechaCreacion":     q["FechaCreacion"],
							"FechaModificacion": q["FechaModificacion"],
							"Activo":            q["Activo"],
							"Codigo":            q["Codigo"],
						})

					}
				}
			}
		}
	}

	return
}

func GetPrimerNivel(catalogoId int, subgrupoId int, getInactivos bool) (nodos []map[string]interface{}, err error) {
	o := orm.NewOrm()

	if catalogoId > 0 {
		qs := o.QueryTable(new(SubgrupoCatalogo)).RelatedSel().Filter("CatalogoId", catalogoId).OrderBy("SubgrupoId__Codigo")

		if !getInactivos {
			qs = qs.Filter("SubgrupoId__Activo", true)
		}

		var subgrupos []SubgrupoCatalogo
		if _, err := qs.All(&subgrupos); err == nil && len(subgrupos) > 0 {
			for _, subgrupo := range subgrupos {

				nodo := make(map[string]interface{})
				nodo["expandible"] = checkSubgrupos(subgrupo.SubgrupoId.Id, getInactivos)
				nodo["data"] = subgrupo.SubgrupoId

				nodos = append(nodos, nodo)
			}
		} else if len(subgrupos) == 0 {
			return nil, nil
		} else {
			return nil, err
		}
	} else {
		qs := o.QueryTable(new(Subgrupo)).RelatedSel().Filter("Id", subgrupoId)

		var subgrupoPadre []Subgrupo
		if _, err := qs.All(&subgrupoPadre); err == nil && len(subgrupoPadre) > 0 {
			nodo := make(map[string]interface{})

			if subgrupoPadre[0].TipoNivelId.Id < 4 {
				nodo["expandible"] = checkSubgrupos(subgrupoId, getInactivos)
			} else {
				nodo["expandible"] = checkElementos(subgrupoId, getInactivos)
			}

			nodo["data"] = subgrupoPadre
			nodos = append(nodos, nodo)

		} else if len(subgrupoPadre) == 0 {
			return nil, nil
		} else {
			return nil, err
		}
	}
	return nodos, nil
}

func GetHijos(subgrupoId int, getInactivos bool, getElementos bool) (nodos []map[string]interface{}, err error) {
	o := orm.NewOrm()

	if getElementos {
		qs := o.QueryTable(new(Subgrupo)).RelatedSel().Filter("Id", subgrupoId)

		var subgrupo Subgrupo
		if sg, err := qs.All(&subgrupo); err == nil && sg > 0 {
			if subgrupo.Id > 0 {
				if subgrupo.TipoNivelId.Id == 3 {
					if subgrupos, err := getSubgrupos(subgrupoId, getInactivos); err == nil && len(subgrupos) > 0 {
						for _, subgrupo := range subgrupos {

							nodo := make(map[string]interface{})
							nodo["expandible"] = checkElementos(subgrupo.SubgrupoHijoId.Id, getInactivos)
							nodo["data"] = subgrupo.SubgrupoHijoId

							nodos = append(nodos, nodo)
						}
					}
				} else if subgrupo.TipoNivelId.Id == 4 {
					if elementos, err := getElementosChildren(subgrupoId, getInactivos); err == nil && len(elementos) > 0 {
						for _, elemento := range elementos {

							nodo := make(map[string]interface{})
							nodo["expandible"] = false
							nodo["data"] = elemento

							nodos = append(nodos, nodo)
						}
					}
				} else {
					if subgrupos, err := getSubgrupos(subgrupoId, getInactivos); err == nil && len(subgrupos) > 0 {
						for _, subgrupo := range subgrupos {

							nodo := make(map[string]interface{})
							nodo["expandible"] = checkSubgrupos(subgrupo.SubgrupoHijoId.Id, getInactivos)
							nodo["data"] = subgrupo.SubgrupoHijoId

							nodos = append(nodos, nodo)
						}
					} else {
						return nil, err
					}
				}
			}
		} else {
			return nil, err
		}
	} else {
		if subgrupos, err := getSubgrupos(subgrupoId, getInactivos); err == nil && len(subgrupos) > 0 {
			for _, subgrupo := range subgrupos {

				nodo := make(map[string]interface{})
				nodo["expandible"] = checkSubgrupos(subgrupo.SubgrupoHijoId.Id, getInactivos)
				nodo["data"] = subgrupo.SubgrupoHijoId

				nodos = append(nodos, nodo)
			}
		} else if len(subgrupos) == 0 {
			return nil, nil
		} else {
			return nil, err
		}
	}
	return
}

func getSubgrupos(subgrupoId int, getInactivos bool) (lista []SubgrupoSubgrupo, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(SubgrupoSubgrupo)).RelatedSel().Filter("SubgrupoPadreId__Id", subgrupoId).OrderBy("SubgrupoHijoId__Codigo")

	if !getInactivos {
		qs = qs.Filter("SubgrupoHijoId__Activo", true)
	}

	var subgrupos []SubgrupoSubgrupo
	if _, err := qs.All(&subgrupos); err == nil {
		return subgrupos, err
	} else {
		return nil, err
	}
}

func getElementosChildren(subgrupoId int, getInactivos bool) (elementos []Elemento, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(Elemento)).RelatedSel().Filter("SubgrupoId", subgrupoId).OrderBy("Codigo")
	if !getInactivos {
		qs = qs.Filter("Activo", true)
	}

	if _, err := qs.All(&elementos); err == nil {
		return elementos, nil
	}
	return nil, err
}

func checkSubgrupos(subgrupoId int, getInactivos bool) (hasSubgrupos bool) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(SubgrupoSubgrupo)).RelatedSel().Filter("SubgrupoPadreId__Id", subgrupoId)
	if !getInactivos {
		qs = qs.Filter("SubgrupoHijoId__Activo", true)
	}

	hasSubgrupos = qs.Exist()

	return hasSubgrupos
}

func checkElementos(subgrupoId int, getInactivos bool) (hasElementos bool) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(Elemento)).RelatedSel().Filter("SubgrupoId", subgrupoId)
	if !getInactivos {
		qs = qs.Filter("Activo", true)
	}

	hasElementos = qs.Exist()

	return hasElementos
}
