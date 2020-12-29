package models

import (
	"github.com/astaxie/beego/logs"
	"github.com/udistrital/utils_oas/time_bogota"

	"github.com/astaxie/beego/orm"
)


type TrSubgrupo struct {
	SubgrupoPadre *Subgrupo
	SubgrupoHijo  *Subgrupo
        DetalleSubgrupo *DetalleSubgrupo
}

// AddTransaccionSubgrupo Transacción para registrar toda la información de un subgrupo asociándolo a un catálogo
func AddTransaccionSubgrupo(m *TrSubgrupo) (err error) {
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

//	for _, v := range *m.SubgrupoHijo {
		m.SubgrupoHijo.FechaCreacion = time_bogota.TiempoBogotaFormato()
	        m.SubgrupoHijo.FechaModificacion = time_bogota.TiempoBogotaFormato()

		// SE INSERTA SUBGRUPO
		if idSubgrupoHijo, err := o.Insert(m.SubgrupoHijo); err == nil {
			m.SubgrupoHijo.Id = int(idSubgrupoHijo)

			// SE INSERTA SUBGRUPO_SUBGRUO
			var subGrupoSubgrupo SubgrupoSubgrupo
			subGrupoSubgrupo.Activo = true
			subGrupoSubgrupo.FechaCreacion = time_bogota.TiempoBogotaFormato()
			subGrupoSubgrupo.FechaModificacion = time_bogota.TiempoBogotaFormato()
			subGrupoSubgrupo.SubgrupoPadreId = m.SubgrupoPadre
			subGrupoSubgrupo.SubgrupoHijoId = m.SubgrupoHijo

			if _, err = o.Insert(&subGrupoSubgrupo); err != nil {
				panic(err.Error())
			}


                        if (m.DetalleSubgrupo != nil) {
				m.DetalleSubgrupo.SubgrupoId = m.SubgrupoHijo 
				m.DetalleSubgrupo.Activo = true
				m.DetalleSubgrupo.FechaCreacion = time_bogota.TiempoBogotaFormato()
				m.DetalleSubgrupo.FechaModificacion = time_bogota.TiempoBogotaFormato()
				if _, err = o.Insert(m.DetalleSubgrupo); err != nil {
					panic(err.Error())
				}
                        }



		} else {
			panic(err.Error())
		}

//	}

	return
}

func GetTransaccionSubgrupo(id int) (v []interface{}, err error) {
	o := orm.NewOrm()
	var Grupo Subgrupo
	var Detalle DetalleSubgrupo

	if _, err := o.QueryTable(new(Subgrupo)).RelatedSel().Filter("Id", id).Filter("Activo", true).All(&Grupo); err == nil {

		if _, err := o.QueryTable(new(DetalleSubgrupo)).RelatedSel().Filter("SubgrupoId", id).Filter("Activo", true).All(&Detalle); err == nil {

			v = append(v, map[string]interface{}{
				"Subgrupo": Grupo,
				"Detalle":  Detalle,
			})
			return v, nil

		}
	}
	return nil, err
}



func UpdateTransaccionSubgrupo(m *TrSubgrupo) (err error) {
	o := orm.NewOrm()
	err = o.Begin()
	logs.Info("llega aqui")

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

	var Detalle DetalleSubgrupo
	w := m.DetalleSubgrupo

	v := Subgrupo{Id: m.SubgrupoHijo.Id}

	if errTr := o.Read(&v); errTr == nil {

		if _, err = o.Update(m.SubgrupoHijo, "Activo", "Nombre", "Codigo", "Descripcion"); err == nil {
           if (m.DetalleSubgrupo != nil) {
			    if _, err := o.QueryTable(new(DetalleSubgrupo)).RelatedSel().Filter("Id", m.DetalleSubgrupo.Id).Filter("Activo", true).All(&Detalle); err == nil {
		            Detalle.Activo = false
	                logs.Info("Detalle consultado")
                    if (m.DetalleSubgrupo.Id == 0) {
	                    logs.Info("El id es cero")
                        w.FechaCreacion = time_bogota.TiempoBogotaFormato()
                        w.FechaModificacion = time_bogota.TiempoBogotaFormato()
                        if _, err = o.Insert(w); err != nil {
                            panic(err.Error())
                        }
                    } else {
                        if _, err = o.Update(m.DetalleSubgrupo,"Depreciacion","Valorizacion","Deterioro","Activo", "TipoBienId"); err == nil {
                            w.Id = 0
                        /*    w.FechaCreacion = time_bogota.TiempoBogotaFormato()
                            w.FechaModificacion = time_bogota.TiempoBogotaFormato()
                        if _, err = o.Insert(w); err != nil {
                            panic(err.Error())
                        }*/
                        } else {
                            panic(err.Error())
                        }
                   }
			    } else {
				    panic(err.Error())
			    }
          }
	  } else {
		panic(err.Error())
	  }
  } else {
	panic(err.Error())
  }
  return
}




