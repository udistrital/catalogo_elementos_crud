package models

import (
	"fmt"

	"github.com/astaxie/beego/logs"
	"github.com/astaxie/beego/orm"
	"github.com/udistrital/utils_oas/time_bogota"
)

type TransaccionCuentasGrupo struct {
	Cuentas []CuentasSubgrupo
}

// AddCuentasGrupo insert a new CuentasGrupo into database and returns
// last inserted Id on success.
func AddTransaccionCuentasGrupo(m *TransaccionCuentasGrupo) (id int64, err error) {

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
	fmt.Println("ok")
	for _, v := range m.Cuentas {
		v.FechaCreacion = time_bogota.TiempoBogotaFormato()
		v.FechaModificacion = time_bogota.TiempoBogotaFormato()
		v.Activo = true
		if _, err = o.Insert(&v); err != nil {
			panic(err.Error())
		}
		fmt.Println("ok")
	}

	return
}

// GetTransaccionCuentasGrupo retrieves CuentasGrupo by Subgrupo__Id. Returns error if
// Id doesn't exist
func GetTransaccionCuentasGrupo(id int) (v []interface{}, err error) {
	o := orm.NewOrm()
	var Cuentas_Movimientos []CuentasSubgrupo
	var w []interface{}
	var q []interface{}
	if _, err := o.QueryTable(new(CuentasSubgrupo)).RelatedSel().Filter("SubgrupoId__Id", id).Filter("Activo", true).All(&Cuentas_Movimientos); err == nil {

		fmt.Println(Cuentas_Movimientos)

		for _, s := range Cuentas_Movimientos {
			q = append(q, map[string]interface{}{
				"Id":                  s.Id,
				"CuentaDebitoId":      s.CuentaDebitoId,
				"CuentaCreditoId":     s.CuentaCreditoId,
				"SubtipoMovimientoId": s.SubtipoMovimientoId,
				"SubgrupoId":          s.SubgrupoId,
				"Activo":              s.Activo,
				"FechaCreacion":       s.FechaCreacion,
				"FechaModificacion":   s.FechaModificacion,
			})
		}

		w = append(w, map[string]interface{}{
			"Cuentas": &q,
		})

		return w, nil
	}
	return nil, err

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
					r.FechaModificacion = time_bogota.TiempoBogotaFormato()
					r.FechaCreacion = r.FechaModificacion
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
			r.FechaModificacion = time_bogota.TiempoBogotaFormato()
			r.FechaCreacion = r.FechaModificacion
			if _, err = o.Insert(&r); err != nil {
				panic(err.Error())
			}

		}

	}

	return
}
