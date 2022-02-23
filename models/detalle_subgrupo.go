package models

import (
	"errors"
	"fmt"
	"reflect"
	"strings"
	"time"

	"github.com/astaxie/beego/orm"
)

type DetalleSubgrupo struct {
	Id                int       `orm:"column(id);pk;auto"`
	Depreciacion      bool      `orm:"column(depreciacion)"`
	Valorizacion      bool      `orm:"column(valorizacion)"`
	Amortizacion      bool      `orm:"column(amortizacion)"`
	VidaUtil          float64   `orm:"column(vida_util);null"`
	ValorResidual     float64   `orm:"column(valor_residual);null"`
	Activo            bool      `orm:"column(activo)"`
	FechaCreacion     time.Time `orm:"column(fecha_creacion);type(timestamp with time zone)"`
	FechaModificacion time.Time `orm:"column(fecha_modificacion);type(timestamp with time zone)"`
	SubgrupoId        *Subgrupo `orm:"column(subgrupo_id);rel(fk)"`
	TipoBienId        *TipoBien `orm:"column(tipo_bien_id);rel(fk)"`
}

func (t *DetalleSubgrupo) TableName() string {
	return "detalle_subgrupo"
}

func init() {
	orm.RegisterModel(new(DetalleSubgrupo))
}

// AddDetalleSubgrupo insert a new DetalleSubgrupo into database and returns
// last inserted Id on success.
func AddDetalleSubgrupo(m *DetalleSubgrupo) (id int64, err error) {
	o := orm.NewOrm()
	id, err = o.Insert(m)
	return
}

// GetDetalleSubgrupoById retrieves DetalleSubgrupo by Id. Returns error if
// Id doesn't exist
func GetDetalleSubgrupoById(id int) (v *DetalleSubgrupo, err error) {
	o := orm.NewOrm()
	v = &DetalleSubgrupo{Id: id}
	if err = o.Read(v); err == nil {
		return v, nil
	}
	return nil, err
}

// GetAllDetalleSubgrupo retrieves all DetalleSubgrupo matches certain condition. Returns empty list if
// no records exist
func GetAllDetalleSubgrupo(query map[string]string, fields []string, sortby []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(DetalleSubgrupo)).RelatedSel()
	// query k=v
	for k, v := range query {
		// rewrite dot-notation to Object__Attribute
		k = strings.Replace(k, ".", "__", -1)
		if strings.Contains(k, "isnull") {
			qs = qs.Filter(k, (v == "true" || v == "1"))
		} else if strings.Contains(k, "in") {
			arr := strings.Split(v, "|")
			qs = qs.Filter(k, arr)
		} else {
			qs = qs.Filter(k, v)
		}
	}
	// order by:
	var sortFields []string
	if len(sortby) != 0 {
		if len(sortby) == len(order) {
			// 1) for each sort field, there is an associated order
			for i, v := range sortby {
				orderby := ""
				if order[i] == "desc" {
					orderby = "-" + v
				} else if order[i] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
			qs = qs.OrderBy(sortFields...)
		} else if len(sortby) != len(order) && len(order) == 1 {
			// 2) there is exactly one order, all the sorted fields will be sorted by this order
			for _, v := range sortby {
				orderby := ""
				if order[0] == "desc" {
					orderby = "-" + v
				} else if order[0] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
		} else if len(sortby) != len(order) && len(order) != 1 {
			return nil, errors.New("Error: 'sortby', 'order' sizes mismatch or 'order' size is not 1")
		}
	} else {
		if len(order) != 0 {
			return nil, errors.New("Error: unused 'order' fields")
		}
	}

	var l []DetalleSubgrupo
	qs = qs.OrderBy(sortFields...)
	if _, err = qs.Limit(limit, offset).All(&l, fields...); err == nil {
		if len(fields) == 0 {
			for _, v := range l {
				ml = append(ml, v)
			}
		} else {
			// trim unused fields
			for _, v := range l {
				m := make(map[string]interface{})
				val := reflect.ValueOf(v)
				for _, fname := range fields {
					m[fname] = val.FieldByName(fname).Interface()
				}
				ml = append(ml, m)
			}
		}
		return ml, nil
	}
	return nil, err
}

// UpdateDetalleSubgrupo updates DetalleSubgrupo by Id and returns error if
// the record to be updated doesn't exist
func UpdateDetalleSubgrupoById(m *DetalleSubgrupo) (err error) {
	o := orm.NewOrm()
	v := DetalleSubgrupo{Id: m.Id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Update(m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}

// DeleteDetalleSubgrupo deletes DetalleSubgrupo by Id and returns error if
// the record to be deleted doesn't exist
func DeleteDetalleSubgrupo(id int) (err error) {
	o := orm.NewOrm()
	v := DetalleSubgrupo{Id: id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Delete(&DetalleSubgrupo{Id: id}); err == nil {
			fmt.Println("Number of records deleted in database:", num)
		}
	}
	return
}
