package controllers

import (
	"encoding/json"
	"errors"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
	"github.com/udistrital/catalogo_elementos_crud/models"
	"github.com/udistrital/utils_oas/errorctrl"
)

// TrCuentasSubgrupoController operations for Tr_subgrupo
type TrCuentasSubgrupoController struct {
	beego.Controller
}

// URLMapping ...
func (c *TrCuentasSubgrupoController) URLMapping() {
	c.Mapping("GetOne", c.GetOne)
	c.Mapping("Put", c.Put)
}

// GetOne ...
// @Title GetOne
// @Description Consulta las cuentas asignadas a un determinado subgrupo
// @Param	id		path 	string	true	"subgrupoId del que se consultan las cuentas"
// @Success 200 {object} []models.CuentasSubgrupo
// @Failure 403 :id is empty
// @router /:id [get]
func (c *TrCuentasSubgrupoController) GetOne() {

	defer errorctrl.ErrorControlController(c.Controller, "TrCuentasSubgrupoController")

	var id int
	if v, err := c.GetInt(":id"); err != nil || v <= 0 {
		if err == nil {
			err = errors.New("Se debe especificar una subgrupo válido")
		}
		panic(errorctrl.Error(`GetOne - c.GetInt(":id")`, err, "400"))
	} else {
		id = v
	}

	if l, err := models.GetCuentasSubgrupoBySubgrupoId(id); err != nil {
		logs.Error(err)
		//c.Data["development"] = map[string]interface{}{"Code": "000", "Body": err.Error(), "Type": "error"}
		c.Data["system"] = err
		c.Abort("404")
	} else {
		c.Data["json"] = l
	}
	c.ServeJSON()
}

// Put ...
// @Title Put
// @Description Actualiza cuentas contables de un subgrupo
// @Param	id		path 	string	true		"Subgrupo Id al que se le asignan las cuentas"
// @Param	body	body 	models.CuentasSubgrupo	true	"Lista de cuentas que se asignarán al subgrupo"
// @Success 200 {object} []models.CuentasSubgrupo
// @Failure 400 the request contains incorrect syntax
// @router /:id [put]
func (c *TrCuentasSubgrupoController) Put() {

	defer errorctrl.ErrorControlController(c.Controller, "TrCuentasSubgrupoController")

	var id int
	if v, err := c.GetInt(":id"); err != nil || v <= 0 {
		if err == nil {
			err = errors.New("Se debe especificar una subgrupo válido")
		}
		panic(errorctrl.Error(`Put - c.GetInt(":id")`, err, "400"))
	} else {
		id = v
	}

	var v []*models.CuentasSubgrupo
	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &v); err == nil {
		if n, err := models.UpdateCuentasSubgrupo(v, id); err == nil {
			if n == nil {
				n = append(n, &models.CuentasSubgrupo{})
			}
			c.Data["json"] = n
		} else {
			logs.Error(err)
			//c.Data["development"] = map[string]interface{}{"Code": "000", "Body": err.Error(), "Type": "error"}
			c.Data["system"] = err
			c.Abort("400")
		}
	} else {
		logs.Error(err)
		//c.Data["development"] = map[string]interface{}{"Code": "000", "Body": err.Error(), "Type": "error"}
		c.Data["system"] = err
		c.Abort("400")
	}
	c.ServeJSON()
}
