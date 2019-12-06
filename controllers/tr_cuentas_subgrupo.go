package controllers

import (
	"encoding/json"

	"github.com/astaxie/beego"
	"github.com/udistrital/catalogo_elementos_crud/models"
)

// TrCuentasSubgrupoController operations for Tr_cuentas_subgrupo
type TrCuentasSubgrupoController struct {
	beego.Controller
}

// URLMapping ...
func (c *TrCuentasSubgrupoController) URLMapping() {
	c.Mapping("Post", c.Post)
	//c.Mapping("GetOne", c.GetOne)
	//c.Mapping("GetAll", c.GetAll)
	//c.Mapping("Put", c.Put)
	//c.Mapping("Delete", c.Delete)
}

// Post ...
// @Title Create
// @Description create Tr_cuentas_subgrupo
// @Param	body		body 	models.Tr_cuentas_asociadas	true		"body for Tr_cuentas_asociadas content"
// @Success 201 {object} models.Tr_cuentas_asociadas
// @Failure 403 body is empty
// @router / [post]
func (c *TrCuentasSubgrupoController) Post() {
	//esto deberia ser un get ya que es una consulta y recibir de a un id
	var arreglosubgrupos []models.Subgrupo

	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &arreglosubgrupos); err == nil {
		c.Data["json"] = models.ConsultaCuentas(arreglosubgrupos)
		c.ServeJSON()
	}

}
