package models

import (
	"github.com/astaxie/beego/logs"

	"github.com/astaxie/beego/orm"
)

// GetCatalogo Transacción para consultar el árbol de catálogo
func GetArbolCatalogo(catalogoId int) (arbolCatalogo []map[string]interface{}, err error) {
	o := orm.NewOrm()
	err = o.Begin()

	if err != nil {
		return
	}

	var grupos []SubgrupoCatalogo

	if _, err := o.QueryTable(new(SubgrupoCatalogo)).RelatedSel().Filter("catalogo_id",catalogoId).Filter("Activo",true).All(&grupos); err == nil{

		for _, grupo :=  range grupos {
			data := make(map[string]interface{})
			data["Grupo"] = grupo.SubgrupoId
			data["Subgrupo"] = getSubgrupo(grupo.SubgrupoId.Id)
			arbolCatalogo = append(arbolCatalogo, data)
		}

		return arbolCatalogo, nil
	}
	return nil, err
}

// getSubgrupo Transacción para consultar los subgrupos del árbol del catálogo
func getSubgrupo(subgrupo_padre_id int) (arbolSubgrupo []map[string]interface{}) {
	o := orm.NewOrm()
	var err = o.Begin()

	if err != nil {
		return
	}

	var subgrupos []SubgrupoSubgrupo

	if _, err := o.QueryTable(new(SubgrupoSubgrupo)).RelatedSel().Filter("subgrupo_padre_id",subgrupo_padre_id).Filter("Activo",true).All(&subgrupos); err == nil{

		for _, subgrupoHijo :=  range subgrupos {
			logs.Debug(subgrupoHijo.SubgrupoHijoId)

			data := make(map[string]interface{})
			data["Subgrupo"] = subgrupoHijo.SubgrupoHijoId

			if(getHijo(subgrupoHijo.SubgrupoHijoId.Id)) {
				data["SubgrupoSubgrupo"] = getSubgrupo(subgrupoHijo.SubgrupoHijoId.Id)
			}

			arbolSubgrupo = append(arbolSubgrupo, data)
		}

	}
	return
}

// getHijo Función para consultar si un subgrupo tiene hijos
func getHijo(subgrupo_padre_id int) (hijo bool) {
	o := orm.NewOrm()
	var err = o.Begin()

	if err != nil {
		return
	}

	var subgrupos []SubgrupoSubgrupo

	hijo = false

	if _, err := o.QueryTable(new(SubgrupoSubgrupo)).RelatedSel().Filter("subgrupo_padre_id",subgrupo_padre_id).Filter("Activo",true).All(&subgrupos); err == nil{

		for _, subgrupoHijo :=  range subgrupos {
			logs.Debug(subgrupoHijo)
			hijo = true
		}

	}
	return hijo
}