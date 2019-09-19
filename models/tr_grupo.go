package models

import (
	"github.com/astaxie/beego/logs"

	"github.com/astaxie/beego/orm"
)

type TrGrupo struct {
	Catalogo *Catalogo
	Subgrupo *Subgrupo
}

// AddTransaccionProduccionAcademica Transacción para registrar toda la información de un grupo asociándolo a un catálogo
func AddTransaccionProduccionAcademica(m *TrGrupo) (err error) {
	o := orm.NewOrm()
	err = o.Begin()

	logs.Debug("Entre aqui")

	if idSubgrupo, errTr := o.Insert(m.Subgrupo); errTr == nil {
		logs.Info(idSubgrupo)

		var subgrupoCatalogo SubgrupoCatalogo

		subgrupoCatalogo.Activo = true
		subgrupoCatalogo.CatalogoId = m.Catalogo
		subgrupoCatalogo.SubgrupoId = m.Subgrupo

		logs.Debug(subgrupoCatalogo)

		if _, errTr = o.Insert(&subgrupoCatalogo); errTr != nil {
			err = errTr
			logs.Info(err)
			_ = o.Rollback()
			return
		}

		_ = o.Commit()

	} else {
		err = errTr
		logs.Info(err)
		_ = o.Rollback()
	}

	return
}
