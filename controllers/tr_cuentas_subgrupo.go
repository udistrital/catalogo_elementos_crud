package controllers

import (
	"encoding/json"
	"strconv"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
	"github.com/udistrital/catalogo_elementos_crud/models"
)

// TrCuentasSubgrupoController operations for Tr_subgrupo
type TrCuentasSubgrupoController struct {
	beego.Controller
}

// URLMapping ...
func (c *TrCuentasSubgrupoController) URLMapping() {
	c.Mapping("Put", c.Put)
}

// GetOne ...
// @Title GetOne
// @Description get TrSubgrupo by id
// @Param	id		path 	string	true		"The key for staticblock"
// @Success 200 {object} models.TransaccionCuentasGrupo
// @Failure 403 :id is empty
// @router /:id [get]
func (c *TrCuentasSubgrupoController) GetAllById() {
	idPersonaStr := c.Ctx.Input.Param(":id")
	id, _ := strconv.Atoi(idPersonaStr)
	l, err := models.GetTransaccionCuentasGrupo(id)
	if err != nil {
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
// @Description update the TrSubgrupo
// @Param	id		path 	string	true		"The id you want to update"
// @Param	body		body 	models.TransaccionCuentasGrupo true		"body for TrSubgrupo content"
// @Success 200 {object} models.TrSubgrupo
// @Failure 400 the request contains incorrect syntax
// @router /:id [put]
func (c *TrCuentasSubgrupoController) Put() {
	idPersonaStr := c.Ctx.Input.Param(":id")
	id, _ := strconv.Atoi(idPersonaStr)
	var v models.TransaccionCuentasGrupo
	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &v); err == nil {
		if err := models.UpdateCuentas_GrupoById(&v, id); err == nil {
			c.Data["json"] = v
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
