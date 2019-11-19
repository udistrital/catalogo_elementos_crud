package models

import (
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

	m.Subgrupo.Activo = true
	if idSubgrupo, err := o.Insert(m.Subgrupo); err == nil {
		logs.Info(idSubgrupo)

		var subgrupoCatalogo SubgrupoCatalogo

		subgrupoCatalogo.Activo = true
		subgrupoCatalogo.CatalogoId = m.Catalogo
		subgrupoCatalogo.SubgrupoId = m.Subgrupo

		if _, err = o.Insert(&subgrupoCatalogo); err != nil {
			panic(err.Error())
		}

		m.DetalleSubgrupo.SubgrupoId = m.Subgrupo
		m.DetalleSubgrupo.Activo = true
		if _, err = o.Insert(m.DetalleSubgrupo); err != nil {
			panic(err.Error())
		}

	} else {
		panic(err.Error())
	}

	return
}
