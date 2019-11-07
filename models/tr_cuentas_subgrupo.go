package models

import (
	"fmt"
	"github.com/astaxie/beego/orm"
)

type TransaccionCuentasGrupo struct {
	Cuentas		[]CuentasSubgrupo
}

// AddCuentasGrupo insert a new CuentasGrupo into database and returns
// last inserted Id on success.
func AddTransaccionCuentasGrupo(m *TransaccionCuentasGrupo) (id int64, err error) {
	
	var flag = false
	o := orm.NewOrm()
	err = o.Begin()
	for _, v := range m.Cuentas {

		if _, err = o.Insert(&v); err == nil {
		} else {
			err = err
			flag = true
			fmt.Println(err)
			_ = o.Rollback()
			return
		}
	}

	if flag {
		err = o.Rollback()
	} else {
		err = o.Commit()
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
	if _, err := o.QueryTable(new(CuentasSubgrupo)).RelatedSel().Filter("SubgrupoId__Id",id).Filter("Activo",true).All(&Cuentas_Movimientos); err == nil{

		fmt.Println(Cuentas_Movimientos)

		for _, s := range Cuentas_Movimientos {
			q = append(q,map[string]interface{}{
				"Id": s.Id,
				"CuentaDebitoId": s.CuentaDebitoId,
				"CuentaCreditoId": s.CuentaCreditoId,
				"SubtipoMovimientoId": s.SubtipoMovimientoId,
				"SubgrupoId": s.SubgrupoId,
				"Activo": s.Activo,
				"FechaCreacion": s.FechaCreacion,
				"FechaModificacion": s.FechaModificacion,
			})
		}

		w = append(w,map[string]interface{}{
			"Cuentas": &q,
		})

		return w, nil
	}
	return nil, err
	
}

// UpdateCuentasGrupo updates CuentasGrupo by Id and returns error if
// the record to be updated doesn't exist
func UpdateCuentas_GrupoById(m *TransaccionCuentasGrupo) (err error) {
	var flag = false;
	o := orm.NewOrm()
	err = o.Begin()

	for _, v := range m.Cuentas {
		
		w := CuentasSubgrupo{Id: v.Id}
		if errTr := o.Read(&w); errTr == nil {
			if _, errTr = o.Update(&v,"CuentaDebitoId","CuentaCreditoId","SubtipoMovimientoId","Activo","SubgrupoId"); errTr != nil {
				err = errTr
				flag = true;
				fmt.Println(err)
				_ = o.Rollback()
				return
			}

		}
		
	}

	if flag {
		err = o.Rollback()
	} else {
		err = o.Commit()
	}

	return
}
