package controllers

import (
	"encoding/json"
	"strconv"

	"github.com/udistrital/catalogo_elementos_crud/models"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
)

// TrGrupoController operations for TrGrupoController
type TrGrupoController struct {
	beego.Controller
}

// URLMapping ...
func (c *TrGrupoController) URLMapping() {
	c.Mapping("Post", c.Post)
	c.Mapping("GetOne", c.GetOne)
}

// Post ...
// @Title Create
// @Description create TrGrupoController
// @Param	body		body 	models.TrGrupoController	true		"body for TrGrupoController content"
// @Success 201 {object} models.TrGrupo
// @Failure 403 body is empty
// @router / [post]
func (c *TrGrupoController) Post() {
	var v models.TrGrupo
	logs.Info("al llegar")
	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &v); err == nil {
		logs.Info(v)
		if err := models.AddTransaccionGrupo(&v); err == nil {
			c.Ctx.Output.SetStatus(201)
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

// GetOne ...
// @Title GetOne
// @Description get TrGrupoController by id
// @Param	id		path 	string	true		"The key for staticblock"
// @Success 200 {object} models.TrGrupoController
// @Failure 403 :id is empty
// @router /:id [get]
func (c *TrGrupoController) GetOne() {
	idCatalogoStr := c.Ctx.Input.Param(":id")
	idCatalogo, _ := strconv.Atoi(idCatalogoStr)
	l, err := models.GetTransaccionGrupo(idCatalogo)
	if err != nil {
		logs.Error(err)
		//c.Data["development"] = map[string]interface{}{"Code": "000", "Body": err.Error(), "Type": "error"}
		c.Data["system"] = err
		c.Abort("404")
	} else {
		if l == nil {
			l = append(l, map[string]interface{}{})
		}
		c.Data["json"] = l
	}
	c.ServeJSON()
}
