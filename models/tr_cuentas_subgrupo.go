package models

import (
	"github.com/astaxie/beego/logs"
	"github.com/astaxie/beego/orm"
)

// GetCuentasSubgrupoBySubgrupoId Consulta la última cuenta activa de cada movimiento para un subgrupo determinado. Retorna arreglo vacío si no hay cuentas
func GetCuentasSubgrupoBySubgrupoId(subgrupoId int) (v []*CuentasSubgrupo, err error) {

	o := orm.NewOrm()

	var cuentas []*CuentasSubgrupo

	if _, err := o.QueryTable(new(CuentasSubgrupo)).Filter("SubgrupoId__Id", subgrupoId).Filter("Activo", true).OrderBy("-FechaCreacion").All(&cuentas); err != nil {
		return nil, err
	}

	return cuentas, nil

}

// UpdateCuentasGrupo actualiza las cuentas contables que hayan cambiado o crea los nuevos registros de ser necesario
func UpdateCuentasSubgrupo(m []*CuentasSubgrupo, id int) (n []*CuentasSubgrupo, err error) {

	o := orm.NewOrm()
	err = o.Begin()

	if err != nil {
		return nil, err
	}

	defer func() {
		if r := recover(); r != nil {
			o.Rollback()
			logs.Error(r)
		} else {
			o.Commit()
		}
	}()

	for _, v := range m {
		if v.Id > 0 {

			var q CuentasSubgrupo
			if err := o.QueryTable(new(CuentasSubgrupo)).RelatedSel().Filter("Id", v.Id).One(&q); err != nil {
				panic(err.Error())
			}

			if (v.CuentaCreditoId != "" && v.CuentaCreditoId != q.CuentaCreditoId) ||
				(v.CuentaDebitoId != "" && v.CuentaDebitoId != q.CuentaDebitoId) ||
				v.SubtipoMovimientoId != q.SubtipoMovimientoId {

				q.Activo = false
				if _, err := o.Update(&q, "Activo"); err != nil {
					panic(err.Error())
				}
			} else {
				continue
			}
		}

		var r CuentasSubgrupo
		r.CuentaCreditoId = v.CuentaCreditoId
		r.CuentaDebitoId = v.CuentaDebitoId
		r.SubtipoMovimientoId = v.SubtipoMovimientoId
		r.SubgrupoId = &Subgrupo{Id: id}
		r.TipoBienId = v.TipoBienId
		r.Activo = true

		if id_, err := o.Insert(&r); err != nil {
			panic(err.Error())
		} else {
			r.Id = int(id_)
			n = append(n, &r)
		}

	}

	return n, nil
}
