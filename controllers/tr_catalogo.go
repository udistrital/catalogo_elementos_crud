package controllers

import (
	"strconv"

	"github.com/udistrital/catalogo_elementos_crud/models"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
)

// TrCatalogoController operations for TrCatalogo
type TrCatalogoController struct {
	beego.Controller
}

// URLMapping ...
func (c *TrCatalogoController) URLMapping() {
	c.Mapping("Post", c.Post)
	c.Mapping("GetOne", c.GetOne)
	c.Mapping("GetAll", c.GetAll)
	c.Mapping("Put", c.Put)
	c.Mapping("Delete", c.Delete)
}

// Post ...
// @Title Create
// @Description create TrCatalogo
// @Param	body		body 	models.TrCatalogo	true		"body for TrCatalogo content"
// @Success 201 {object} models.TrCatalogo
// @Failure 403 body is empty
// @router / [post]
func (c *TrCatalogoController) Post() {

}

// GetOne ...
// @Title GetOne
// @Description get TrCatalogo by id
// @Param	id		path 	string	true		"The key for staticblock"
// @Success 200 {object} models.TrCatalogo
// @Failure 403 :id is empty
// @router /:id [get]
func (c *TrCatalogoController) GetOne() {
	idCatalogoStr := c.Ctx.Input.Param(":id")
	idCatalogo, _ := strconv.Atoi(idCatalogoStr)
	l, err := models.GetArbolCatalogo(idCatalogo)
	if err != nil {
		logs.Error(err)
		//c.Data["development"] = map[string]interface{}{"Code": "000", "Body": err.Error(), "Type": "error"}
		c.Data["system"] = err
		c.Abort("404")
	} else {
		if l == nil {
			//l = append(l, map[string]interface{}{})
		}
		c.Data["json"] = l
	}
	c.ServeJSON()
}

// GetAll ...
// @Title GetAll
// @Description get TrCatalogo
// @Param	query	query	string	false	"Filter. e.g. col1:v1,col2:v2 ..."
// @Param	fields	query	string	false	"Fields returned. e.g. col1,col2 ..."
// @Param	sortby	query	string	false	"Sorted-by fields. e.g. col1,col2 ..."
// @Param	order	query	string	false	"Order corresponding to each sortby field, if single value, apply to all sortby fields. e.g. desc,asc ..."
// @Param	limit	query	string	false	"Limit the size of result set. Must be an integer"
// @Param	offset	query	string	false	"Start position of result set. Must be an integer"
// @Success 200 {object} models.TrCatalogo
// @Failure 403
// @router / [get]
func (c *TrCatalogoController) GetAll() {

}

// Put ...
// @Title Put
// @Description update the TrCatalogo
// @Param	id		path 	string	true		"The id you want to update"
// @Param	body		body 	models.TrCatalogo	true		"body for TrCatalogo content"
// @Success 200 {object} models.TrCatalogo
// @Failure 403 :id is not int
// @router /:id [put]
func (c *TrCatalogoController) Put() {

}

// Delete ...
// @Title Delete
// @Description delete the TrCatalogo
// @Param	id		path 	string	true		"The id you want to delete"
// @Success 200 {string} delete success!
// @Failure 403 id is empty
// @router /:id [delete]
func (c *TrCatalogoController) Delete() {

}
