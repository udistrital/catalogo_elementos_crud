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
	c.Mapping("TreeCatalogo", c.TreeCatalogo)
}

// GetOne ...
// @Title GetOne
// @Description get TrCatalogo by id
// @Param	id					path 	string	true	"ID del catalogo"
// @Param	elementos			query 	bool	false	"traer arbol hasta el nivel elementos"
// @Param	subgruposInactivos	query 	bool	false	"traer arbol con subgrupos inactivos"
// @Success 200 {object} []models.RamaArbolSubgrupo
// @Failure 403 :id is empty
// @router /:id [get]
func (c *TrCatalogoController) GetOne() {
	elementos := false
	subgruposInactivos := false
	if v, err := c.GetBool("elementos"); err == nil {
		elementos = v
	}
	if w, err := c.GetBool("subgruposInactivos"); err == nil {
		subgruposInactivos = w
	}

	idCatalogoStr := c.Ctx.Input.Param(":id")
	idCatalogo, _ := strconv.Atoi(idCatalogoStr)
	l, err := models.GetArbolCatalogo(idCatalogo, elementos, subgruposInactivos)
	if err != nil {
		logs.Error(err)
		//c.Data["development"] = map[string]interface{}{"Code": "000", "Body": err.Error(), "Type": "error"}
		c.Data["system"] = err
		c.Abort("404")
	} else {
		c.Data["json"] = checkResult(l)
	}
	c.ServeJSON()
}

// GetSubgruposTipo_Bien ...
// @Title GetSubgruposTipo_Bien
// @Description get TrCatalogo by id
// @Param	id		path 	string	true		"The key for staticblock"
// @Success 200 {object} []models.Subgrupo
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
		c.Data["json"] = checkResult(l)
	}
	c.ServeJSON()
}

// TreeCatalogo ...
// @Title GetOne
// @Description Consulta del arbol de un catalogo de forma progresiva, es decir, retorna un nivel a la vez. Permite construir el arbol completo o desde una rama en particular
// @Param	primer_nivel	query	bool	false	"Retornar el primer nivel según se especifique el catalogo o un subgrupo" false
// @Param	catalogo_id		query	int	"Catalogo del que se desea obtener el primer nivel. Se ignora si no se desea el primer nivel. En caso contrario, tiene prioridad sobre el subgrupo_id"
// @Param	subgrupo_id		query	int	"SubgrupoId del que se desean los detalles. Ya sea este o no el primer nivel"
// @Param	get_inactivos	query	bool	false	"Incluir componentes inactivos" false
// @Param	get_elementos	query	bool	false	"Incluir el nivel elementos" false
// @Success 200 {object} []models.NodoGenerico
// @router /arbol [get]
func (c *TrCatalogoController) TreeCatalogo() {
	var primerNivel bool
	var subgrupoId int
	var catalogoId int
	var getElementos bool
	var getInactivos bool

	if v, err := c.GetBool("primer_nivel"); err == nil {
		primerNivel = v
	}
	if v, err := c.GetInt("catalogo_id"); err == nil {
		catalogoId = v
	}
	if v, err := c.GetInt("subgrupo_id"); err == nil {
		subgrupoId = v
	}
	if v, err := c.GetBool("get_inactivos"); err == nil {
		getInactivos = v
	}
	if v, err := c.GetBool("get_elementos"); err == nil {
		getElementos = v
	}

	if primerNivel {
		if catalogoId > 0 {
			l, err := models.GetPrimerNivel(catalogoId, 0, getInactivos)
			if err != nil {
				logs.Error(err)
				c.Data["system"] = err
				c.Abort("404")
			} else {
				c.Data["json"] = checkResult(l)
			}
		} else if subgrupoId > 0 {
			l, err := models.GetPrimerNivel(0, subgrupoId, getInactivos)
			if err != nil {
				logs.Error(err)
				c.Data["system"] = err
				c.Abort("404")
			} else {
				c.Data["json"] = checkResult(l)
			}
		} else {
			c.Data["system"] = "Debe indicar un subgrupo o un catalogo"
			c.Abort("404")
		}
	} else if subgrupoId > 0 {
		l, err := models.GetHijos(subgrupoId, getInactivos, getElementos)
		if err != nil {
			logs.Error(err)
			c.Data["system"] = err
			c.Abort("404")
		} else {
			c.Data["json"] = checkResult(l)
		}
	} else {
		c.Data["system"] = "Debe indicar un subgrupo"
		c.Abort("404")
	}

	c.ServeJSON()
}

func checkResult(l []map[string]interface{}) (result []map[string]interface{}) {
	if l == nil {
		result = []map[string]interface{}{}
	} else {
		result = l
	}
	return result
}
