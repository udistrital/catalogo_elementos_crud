package models

import (
	"github.com/astaxie/beego/logs"
	"github.com/astaxie/beego/orm"
)

// GetCuentasSubgrupoBySubgrupoId consulta las cuentas activas asociadas a un subgrupo,
// cuyo tipo de bien asociado también esté activo.
// Retorna arreglo vacío si no hay cuentas.
func GetCuentasSubgrupoBySubgrupoId(subgrupoId, movimientoId int, v *[]*CuentasSubgrupo) (err error) {

	o := orm.NewOrm()

	_, err = o.QueryTable(new(CuentasSubgrupo)).RelatedSel().
		Filter("Activo", true).
		Filter("SubgrupoId__Id", subgrupoId).
		Filter("TipoBienId__Activo", true).
		All(v)

	return
}

// UpdateCuentasSubgrupo actualiza las cuentas contables que hayan cambiado o crea los nuevos registros de ser necesario
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
		if v.CuentaCreditoId == "" || v.CuentaDebitoId == "" {
			continue
		}

		var q CuentasSubgrupo
		_, err = o.QueryTable(new(CuentasSubgrupo)).RelatedSel().
			Filter("Activo", true).
			Filter("SubgrupoId__Id", id).
			Filter("TipoBienId__Id", v.TipoBienId.Id).
			Filter("SubtipoMovimientoId", v.SubtipoMovimientoId).
			Filter("TipoMovimientoId", v.TipoMovimientoId).
			All(&q)

		if err != nil {
			return
		}

		if q.Id > 0 {
			if v.CuentaCreditoId == q.CuentaCreditoId || v.CuentaDebitoId == q.CuentaDebitoId {
				continue
			}

			q.Activo = false
			_, err = o.Update(&q, "Activo")
			if err != nil {
				return
			}
		}

		var r CuentasSubgrupo
		r.CuentaCreditoId = v.CuentaCreditoId
		r.CuentaDebitoId = v.CuentaDebitoId
		r.TipoMovimientoId = v.TipoMovimientoId
		r.SubtipoMovimientoId = v.SubtipoMovimientoId
		r.SubgrupoId = &Subgrupo{Id: id}
		r.TipoBienId = v.TipoBienId
		r.Activo = true

		if id_, err_ := o.Insert(&r); err_ != nil {
			err = err_
			return
		} else {
			r.Id = int(id_)
			n = append(n, &r)
		}

		n = append(n, &r)
	}

	return n, nil
}
