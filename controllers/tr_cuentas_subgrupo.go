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
// @Description Tr_cuentas_subgrupo su función es permitir una consulta de n cuentas asociadas a subgrupos
// @Param	body		body 	models.Tr_cuentas_subgrupo	true		"body for Tr_cuentas_subgrupo content (Recibe un arreglo de subgrupos, cada subgrupo debe llevar un Id definido)"
// @Success 201 {object} models.Tr_cuentas_subgrupo
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
