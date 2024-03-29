package controllers

import (
	"encoding/json"
	"strconv"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
	"github.com/udistrital/catalogo_elementos_crud/models"
)

// TrSubgrupoController operations for Tr_subgrupo
type TrSubgrupoController struct {
	beego.Controller
}

// URLMapping ...
func (c *TrSubgrupoController) URLMapping() {
	c.Mapping("Post", c.Post)
	c.Mapping("GetOne", c.GetOne)
	// c.Mapping("GetAll", c.GetAll)
	c.Mapping("Put", c.Put)
	// c.Mapping("Delete", c.Delete)
}

// Post ...
// @Title Create
// @Description create TrSubgrupo
// @Param	body		body 	models.TrSubgrupo	true		"body for TrSubgrupo content"
// @Success 201 {object} models.TrSubgrupo
// @Failure 403 body is empty
// @router / [post]
func (c *TrSubgrupoController) Post() {
	var v models.TrSubgrupo
	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &v); err == nil {
		if err := models.AddTransaccionSubgrupo(&v); err == nil {
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
// @Description get TrSubgrupo by id
// @Param	id		path 	string	true		"The key for staticblock"
// @Success 200 {object} []models.SubgrupoDetalle1
// @Failure 403 :id is empty
// @router /:id [get]
func (c *TrSubgrupoController) GetOne() {
	idCatalogoStr := c.Ctx.Input.Param(":id")
	idCatalogo, _ := strconv.Atoi(idCatalogoStr)
	l, err := models.GetTransaccionSubgrupo(idCatalogo)
	if err != nil {
		logs.Error(err)
		//c.Data["development"] = map[string]interface{}{"Code": "000", "Body": err.Error(), "Type": "error"}
		c.Data["system"] = err
		c.Abort("404")
	} else {
		if l == nil {
			l = []interface{}{}
		}
		c.Data["json"] = l
	}
	c.ServeJSON()
}

// GetAll ...
// @Title GetAll
// @Description get TrSubgrupo
// @Param	query	query	string	false	"Filter. e.g. col1:v1,col2:v2 ..."
// @Param	fields	query	string	false	"Fields returned. e.g. col1,col2 ..."
// @Param	sortby	query	string	false	"Sorted-by fields. e.g. col1,col2 ..."
// @Param	order	query	string	false	"Order corresponding to each sortby field, if single value, apply to all sortby fields. e.g. desc,asc ..."
// @Param	limit	query	string	false	"Limit the size of result set. Must be an integer"
// @Param	offset	query	string	false	"Start position of result set. Must be an integer"
// @Success 200 {object} models.TrSubgrupo
// @Failure 403
// @router / [get]
/*
func (c *TrSubgrupoController) GetAll() {
}
*/

// Put ...
// @Title Put
// @Description update the TrSubgrupo
// @Param	id		path 	string	true		"The id you want to update"
// @Param	body		body 	models.TrSubgrupo	true		"body for TrSubgrupo content"
// @Success 200 {object} models.TrSubgrupo
// @Failure 400 the request contains incorrect syntax
// @router /:id [put]
func (c *TrSubgrupoController) Put() {
	var v models.TrSubgrupo
	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &v); err == nil {
		if err := models.UpdateTransaccionSubgrupo(&v); err == nil {
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

/*
func (c *TrSubgrupoController) Put() {
}

*/

// Delete ...
// @Title Delete
// @Description delete the Tr_subgrupo
// @Param	id		path 	string	true		"The id you want to delete"
// @Success 200 {string} delete success!
// @Failure 404 not found resource
// @router /:id [delete]
/*
func (c *TrSubgrupoController) Delete() {

}
*/
