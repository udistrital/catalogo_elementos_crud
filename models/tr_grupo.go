package models

import (
	"fmt"

	"github.com/astaxie/beego/logs"
	"github.com/astaxie/beego/orm"
)

type TrGrupo struct {
	Catalogo        *Catalogo
	Subgrupo        *Subgrupo
	DetalleSubgrupo *DetalleSubgrupo
}

// AddTransaccionProduccionAcademica Transacción para registrar toda la información de un grupo asociándolo a un catálogo
func AddTransaccionGrupo(m *TrGrupo) (err error) {
	o := orm.NewOrm()
	logs.Info(m)
	err = o.Begin()

	if err != nil {
		return
	}

	defer func() {
		if r := recover(); r != nil {
			o.Rollback()
			logs.Error(r)
		} else {
			o.Commit()
		}
	}()

	if idSubgrupo, err := o.Insert(m.Subgrupo); err == nil {
		logs.Info(idSubgrupo)
		logs.Info(m.Catalogo)
		logs.Info(m.Subgrupo)
		logs.Info(m.DetalleSubgrupo)

		var subgrupoCatalogo SubgrupoCatalogo

		subgrupoCatalogo.Activo = true
		subgrupoCatalogo.CatalogoId = m.Catalogo
		subgrupoCatalogo.SubgrupoId = m.Subgrupo

		if _, err = o.Insert(&subgrupoCatalogo); err != nil {
			panic(err.Error())
		}

	} else {
		panic(err.Error())
	}

	return
}

func GetTransaccionGrupo(id int) (v []interface{}, err error) {
	o := orm.NewOrm()
	var Grupo Subgrupo
	var Detalle DetalleSubgrupo
	var Catalogo SubgrupoCatalogo

	if _, err := o.QueryTable(new(Subgrupo)).RelatedSel().Filter("Id", id).Filter("Activo", true).All(&Grupo); err == nil {

		if _, err := o.QueryTable(new(DetalleSubgrupo)).RelatedSel().Filter("SubgrupoId", id).Filter("Activo", true).All(&Detalle); err == nil {

			if _, err := o.QueryTable(new(SubgrupoCatalogo)).RelatedSel().Filter("SubgrupoId", id).Filter("Activo", true).All(&Catalogo); err == nil {

				fmt.Println("Acta :", Grupo)
				fmt.Println("Acta :", Detalle)
				fmt.Println("Acta :", Catalogo.CatalogoId)
				v = append(v, map[string]interface{}{
					"Catalogo": Catalogo.CatalogoId,
					"Subgrupo": Grupo,
					"Detalle":  Detalle,
				})
				return v, nil
			}
		}
	}
	return nil, err

}
