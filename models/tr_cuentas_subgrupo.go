package models

import (
	"fmt"
	"time"

	"github.com/astaxie/beego/orm"
	//"github.com/udistrital/arka_mid/models"
)

//SubgrupoCuentas define la estructura requerida para devolver las cuentas asociadas a un subgrupo especifico
type SubgrupoCuentas struct {
	Id                int       `orm:"column(id);pk;auto"`
	Nombre            string    `orm:"column(nombre)"`
	Descripcion       string    `orm:"column(descripcion)"`
	FechaCreacion     time.Time `orm:"auto_now_add;column(fecha_creacion);type(timestamp without time zone)"`
	FechaModificacion time.Time `orm:"auto_now;column(fecha_modificacion);type(timestamp without time zone)"`
	Activo            bool      `orm:"column(activo)"`
	Codigo            int       `orm:"column(codigo)"`
	CuentasAsociadas  []CuentasSubgrupo
}

// ConsultaCuentas Transacción para registrar toda la información de un grupo asociándolo a un catálogo
func ConsultaCuentas(arreglosubgrupos []Subgrupo) (v []SubgrupoCuentas) {
	for _, subgrupo := range arreglosubgrupos {
		if padre := GrupoPadre(&subgrupo); padre != nil {
			cuentas := CuentasAsociadas(*padre)
			fmt.Println(cuentas)
			v = append(v, SubgrupoCuentas{
				Id:                subgrupo.Id,
				Nombre:            subgrupo.Nombre,
				Descripcion:       subgrupo.Nombre,
				FechaCreacion:     subgrupo.FechaCreacion,
				FechaModificacion: subgrupo.FechaModificacion,
				Activo:            subgrupo.Activo,
				Codigo:            subgrupo.Codigo,
				CuentasAsociadas:  cuentas,
			})
		}
	}
	return v
}

// CuentasAsociadas busca las cuentas asociadas a un subgrupo especifico
func CuentasAsociadas(subgrupo Subgrupo) (cuentas []CuentasSubgrupo) {
	o := orm.NewOrm()
	var grupo []CuentasSubgrupo
	if _, err := o.QueryTable(new(CuentasSubgrupo)).RelatedSel().Filter("SubgrupoId", &subgrupo).All(&grupo); err == nil {
		fmt.Println("entra a la consulta cuentas asociadas", grupo)
		for _, cuenta := range grupo {
			fmt.Println("cuenta: ", cuenta.Id, "  l ", cuenta)
			cuentas = append(cuentas, cuenta)
		}
	}
	return cuentas
}

// GrupoPadre busqueda del padre de un subgrupo
func GrupoPadre(subgrupoEntrante *Subgrupo) (v *Subgrupo) {
	//en una consulta no se para que pero lo pongo porque lo ví en tr_catalogo
	o := orm.NewOrm()
	var subsubgrupo []SubgrupoSubgrupo
	if _, err := o.QueryTable(new(SubgrupoSubgrupo)).RelatedSel().Filter("SubgrupoHijoId", subgrupoEntrante).All(&subsubgrupo); err == nil {
		//es un subgrupo hijo
		if len(subsubgrupo) != 0 {
			for _, subgrupo := range subsubgrupo {
				return GrupoPadre(subgrupo.SubgrupoPadreId)
			}
		} else {
			if _, err := o.QueryTable(new(SubgrupoSubgrupo)).RelatedSel().Filter("SubgrupoPadreId", subgrupoEntrante).All(&subsubgrupo); err == nil {
				//es un subgrupo hijo
				for _, subgrupo := range subsubgrupo {
					return subgrupo.SubgrupoPadreId
				}
			}
		}
	}

	return nil
}
