package models

import (
	"github.com/astaxie/beego/logs"
	"github.com/astaxie/beego/orm"
)




// GetTransaccionCuentasGrupo retrieves CuentasGrupo by Subgrupo__Id. Returns error if
// Id doesn't exist
func GetTransaccionCuentasGrupo(id int) (v []*CuentasSubgrupo, err error) {

	o := orm.NewOrm()
	var cuentas []*CuentasSubgrupo

	if _, err := o.QueryTable(new(CuentasSubgrupo)).Filter("SubgrupoId__Id", id).Filter("Activo", true).Distinct().All(&cuentas, "SubtipoMovimientoId"); err != nil {
		return nil, err
	}

	for _, id_ := range cuentas {
		if err := o.QueryTable(new(CuentasSubgrupo)).Filter("SubgrupoId__Id", id).Filter("Activo", true).Filter("SubtipoMovimientoId", id_.SubtipoMovimientoId).OrderBy("-FechaCreacion").One(id_); err != nil {
			return nil, err
		}
	}
	return cuentas, nil

}

// UpdateCuentasGrupo updates CuentasGrupo by Id and returns error if
// the record to be updated doesn't exist
func UpdateCuentas_GrupoById(m *TransaccionCuentasGrupo, id int) (err error) {

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

	for _, v := range m.Cuentas {
		fmt.Println("movimientos:", v)
		fmt.Println("movimientos:", v.Id)
		w := CuentasSubgrupo{Id: v.Id}

		if w.Id != 0 {

			var q CuentasSubgrupo
			if err := o.QueryTable(new(CuentasSubgrupo)).RelatedSel().Filter("Id", v.Id).One(&q); err == nil {
				q.Activo = false
				if _, err = o.Update(&q, "Activo"); err == nil {
					var r CuentasSubgrupo
					r.CuentaCreditoId = v.CuentaCreditoId
					r.CuentaDebitoId = v.CuentaDebitoId
					r.SubtipoMovimientoId = v.SubtipoMovimientoId
					r.Activo = true
					r.SubgrupoId = v.SubgrupoId
					if _, err = o.Insert(&r); err != nil {
						panic(err.Error())
					}

				} else {
					panic(err.Error())
				}
			} else {
				panic(err.Error())
			}

		} else {
			var r CuentasSubgrupo
			r.CuentaCreditoId = v.CuentaCreditoId
			r.CuentaDebitoId = v.CuentaDebitoId
			r.SubtipoMovimientoId = v.SubtipoMovimientoId
			r.Activo = true
			r.SubgrupoId = v.SubgrupoId
			if _, err = o.Insert(&r); err != nil {
				panic(err.Error())
			}

		}

	}

	return
}
