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
	logs.Info("lo que llega")
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

		/*          if (m.DetalleSubgrupo != nil) {
					m.DetalleSubgrupo.SubgrupoId = m.Subgrupo
					m.DetalleSubgrupo.Activo = true
					m.DetalleSubgrupo.FechaCreacion = time_bogota.TiempoBogotaFormato()
					m.DetalleSubgrupo.FechaModificacion = time_bogota.TiempoBogotaFormato()
					if _, err = o.Insert(m.DetalleSubgrupo); err != nil {
						panic(err.Error())
					}
		                }*/
	} else {
		panic(err.Error())
	}

	return
}

func UpdateTransaccionGrupo(m *TrGrupo) (err error) {
	o := orm.NewOrm()
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

	//	var Detalle DetalleSubgrupo
	//	w := m.DetalleSubgrupo

	v := Subgrupo{Id: m.Subgrupo.Id}

	if errTr := o.Read(&v); errTr == nil {

		if _, err = o.Update(m.Subgrupo, "Activo", "Nombre", "Codigo", "Descripcion"); err == nil {

		} else {
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
