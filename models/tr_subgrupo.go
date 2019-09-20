package models

import (
	"github.com/astaxie/beego/logs"

	"github.com/astaxie/beego/orm"
)

type TrSubgrupo struct {
	SubgrupoPadre *Subgrupo
	SubgrupoHijo  *[]Subgrupo
}

// AddTransaccionSubgrupo Transacción para registrar toda la información de un subgrupo asociándolo a un catálogo
func AddTransaccionSubgrupo(m *TrSubgrupo) (err error) {
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

	for _, v := range *m.SubgrupoHijo {

		// SE INSERTA SUBGRUPO
		if idSubgrupoHijo, err := o.Insert(&v); err == nil {
			v.Id = int(idSubgrupoHijo)

			// SE INSERTA SUBGRUPO_SUBGRUO
			var subGrupoSubgrupo SubgrupoSubgrupo
			subGrupoSubgrupo.Activo = true
			subGrupoSubgrupo.SubgrupoPadreId = m.SubgrupoPadre
			subGrupoSubgrupo.SubgrupoHijoId = &v

			if _, err = o.Insert(&subGrupoSubgrupo); err != nil {
				panic(err.Error())
			}

		} else {
			panic(err.Error())
		}

	}

	return
}
