package controllers

import (
	"encoding/json"

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
	c.Mapping("GetAll", c.GetAll)
	c.Mapping("Put", c.Put)
	c.Mapping("Delete", c.Delete)
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
	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &v); err == nil {
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

}

// GetAll ...
// @Title GetAll
// @Description get TrGrupoController
// @Param	query	query	string	false	"Filter. e.g. col1:v1,col2:v2 ..."
// @Param	fields	query	string	false	"Fields returned. e.g. col1,col2 ..."
// @Param	sortby	query	string	false	"Sorted-by fields. e.g. col1,col2 ..."
// @Param	order	query	string	false	"Order corresponding to each sortby field, if single value, apply to all sortby fields. e.g. desc,asc ..."
// @Param	limit	query	string	false	"Limit the size of result set. Must be an integer"
// @Param	offset	query	string	false	"Start position of result set. Must be an integer"
// @Success 200 {object} models.TrGrupoController
// @Failure 403
// @router / [get]
func (c *TrGrupoController) GetAll() {

}

// Put ...
// @Title Put
// @Description update the TrGrupoController
// @Param	id		path 	string	true		"The id you want to update"
// @Param	body		body 	models.TrGrupoController	true		"body for TrGrupoController content"
// @Success 200 {object} models.TrGrupoController
// @Failure 400 the request contains incorrect syntax
// @router /:id [put]
func (c *TrGrupoController) Put() {

}

// Delete ...
// @Title Delete
// @Description delete the TrGrupoController
// @Param	id		path 	string	true		"The id you want to delete"
// @Success 200 {string} delete success!
// @Failure 404 not found resource
// @router /:id [delete]
func (c *TrGrupoController) Delete() {

}
