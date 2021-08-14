package models

import (
	"encoding/json"
	"fmt"
	"strconv"

	"github.com/astaxie/beego/logs"
	"github.com/astaxie/beego/orm"
)

// GetCatalogo Transacción para consultar el árbol de catálogo
func GetArbolCatalogo(catalogoId int, elementos bool, subgruposInactivos bool) (arbolCatalogo []map[string]interface{}, err error) {
	o := orm.NewOrm()

	var grupos []SubgrupoCatalogo

	if _, err := o.QueryTable(new(SubgrupoCatalogo)).RelatedSel().Filter("catalogo_id", catalogoId).Filter("Activo", true).All(&grupos); err == nil {
		for _, grupo := range grupos {
			if grupo.SubgrupoId.Activo == true {
				data := make(map[string]interface{})
				data["data"] = grupo.SubgrupoId
			subgruposHijos := getSubgrupo(grupo.SubgrupoId.Id, elementos, subgruposInactivos)
			if len(subgruposHijos) > 0 {
				data["children"] = subgruposHijos
			}
		}

		return arbolCatalogo, nil
	}
	return nil, err
}

// getSubgrupo Transacción para consultar los subgrupos del árbol del catálogo
func getSubgrupo(subgrupo_padre_id int, elementos bool) (arbolSubgrupo []map[string]interface{}) {
	o := orm.NewOrm()

	var subgrupos []SubgrupoSubgrupo

	if _, err := o.QueryTable(new(SubgrupoSubgrupo)).RelatedSel().Filter("subgrupo_padre_id", subgrupo_padre_id).Filter("Activo", true).All(&subgrupos); err == nil {

		for _, subgrupoHijo := range subgrupos {
			if subgrupoHijo.SubgrupoHijoId.Activo == true {

				data := make(map[string]interface{})
				data["data"] = subgrupoHijo.SubgrupoHijoId

				if subgrupoHijo.SubgrupoHijoId.TipoNivelId.Id < 4 {
				subgruposHijos := getSubgrupo(subgrupoHijo.SubgrupoHijoId.Id, elementos, subgrupoInactivo)
				if len(subgruposHijos) > 0 {
					data["children"] = subgruposHijos
				}

					ListaElementos, _ := GetAllElemento(query, nil, nil, nil, 0, 0)
					if len(ListaElementos) > 0 {
						children := make([]map[string]interface{}, len(ListaElementos))
						for i, elemento := range ListaElementos {
							child := make(map[string]interface{})
							child["data"] = elemento
							children[i] = child
						}
						data["children"] = children
					}
				}

				arbolSubgrupo = append(arbolSubgrupo, data)
			}
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
