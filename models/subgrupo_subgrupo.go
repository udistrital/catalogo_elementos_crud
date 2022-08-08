package models

import (
	"errors"
	"fmt"
	"reflect"
	"strings"
	"time"

	"github.com/astaxie/beego/orm"
)

type SubgrupoSubgrupo struct {
	Id                int       `orm:"column(id);pk;auto"`
	FechaCreacion     time.Time `orm:"column(fecha_creacion);type(timestamp with time zone)"`
	FechaModificacion time.Time `orm:"column(fecha_modificacion);type(timestamp with time zone)"`
	Activo            bool      `orm:"column(activo)"`
	SubgrupoPadreId   *Subgrupo `orm:"column(subgrupo_padre_id);rel(fk)"`
	SubgrupoHijoId    *Subgrupo `orm:"column(subgrupo_hijo_id);rel(fk)"`
}

func (t *SubgrupoSubgrupo) TableName() string {
	return "subgrupo_subgrupo"
}

func init() {
	orm.RegisterModel(new(SubgrupoSubgrupo))
}

// AddSubgrupoSubgrupo insert a new SubgrupoSubgrupo into database and returns
// last inserted Id on success.
func AddSubgrupoSubgrupo(m *SubgrupoSubgrupo) (id int64, err error) {
	o := orm.NewOrm()
	id, err = o.Insert(m)
	return
}

// GetSubgrupoSubgrupoById retrieves SubgrupoSubgrupo by Id. Returns error if
// Id doesn't exist
func GetSubgrupoSubgrupoById(id int) (v *SubgrupoSubgrupo, err error) {
	o := orm.NewOrm()
	v = &SubgrupoSubgrupo{Id: id}
	if err = o.Read(v); err == nil {
		return v, nil
	}
	return nil, err
}

// GetAllSubgrupoSubgrupo retrieves all SubgrupoSubgrupo matches certain condition. Returns empty list if
// no records exist
func GetAllSubgrupoSubgrupo(query map[string]string, fields []string, sortby []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(SubgrupoSubgrupo)).RelatedSel()
	// query k=v
	for k, v := range query {
		// rewrite dot-notation to Object__Attribute
		k = strings.Replace(k, ".", "__", -1)
		if strings.Contains(k, "isnull") {
			qs = qs.Filter(k, (v == "true" || v == "1"))
		} else if strings.HasSuffix(k, "__in") {
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

	var l []SubgrupoSubgrupo
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

// UpdateSubgrupoSubgrupo updates SubgrupoSubgrupo by Id and returns error if
// the record to be updated doesn't exist
func UpdateSubgrupoSubgrupoById(m *SubgrupoSubgrupo) (err error) {
	o := orm.NewOrm()
	v := SubgrupoSubgrupo{Id: m.Id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Update(m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}

// DeleteSubgrupoSubgrupo deletes SubgrupoSubgrupo by Id and returns error if
// the record to be deleted doesn't exist
func DeleteSubgrupoSubgrupo(id int) (err error) {
	o := orm.NewOrm()
	v := SubgrupoSubgrupo{Id: id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Delete(&SubgrupoSubgrupo{Id: id}); err == nil {
			fmt.Println("Number of records deleted in database:", num)
		}
	}
	return
}
