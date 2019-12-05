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
	c.Mapping("GetOne", c.GetOne)
	c.Mapping("GetSubgruposTipo_Bien", c.GetSubgruposTipo_Bien)
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
			l = append(l, map[string]interface{}{})
		}
		c.Data["json"] = l
	}
	c.ServeJSON()
}

// GetSubgruposTipo_Bien ...
// @Title GetSubgruposTipo_Bien
// @Description get TrCatalogo by id
// @Param	id		path 	string	true		"The key for staticblock"
// @Success 200 {object} models.TrCatalogo
// @Failure 403 :id is empty
// @router /tipo_de_bien/:id [get]
func (c *TrCatalogoController) GetSubgruposTipo_Bien() {
	idCatalogoStr := c.Ctx.Input.Param(":id")
	idCatalogo, _ := strconv.Atoi(idCatalogoStr)
	l, err := models.GetSubgruposRelacionados(idCatalogo)
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
