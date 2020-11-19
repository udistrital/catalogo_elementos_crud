// @APIVersion 1.0.0
// @Title beego Test API
// @Description beego has a very cool tools to autogenerate documents for your API
// @Contact astaxie@gmail.com
// @TermsOfServiceUrl http://beego.me/
// @License Apache 2.0
// @LicenseUrl http://www.apache.org/licenses/LICENSE-2.0.html
package routers

import (
	"github.com/udistrital/catalogo_elementos_crud/controllers"

	"github.com/astaxie/beego"
)

func init() {
	ns := beego.NewNamespace("/v1",

		beego.NSNamespace("/catalogo",
			beego.NSInclude(
				&controllers.CatalogoController{},
			),
		),

		beego.NSNamespace("/subgrupo_catalogo",
			beego.NSInclude(
				&controllers.SubgrupoCatalogoController{},
			),
		),

		beego.NSNamespace("/elemento",
			beego.NSInclude(
				&controllers.ElementoController{},
			),
		),

		beego.NSNamespace("/cuentas_subgrupo",
			beego.NSInclude(
				&controllers.CuentasSubgrupoController{},
			),
		),

		beego.NSNamespace("/subgrupo",
			beego.NSInclude(
				&controllers.SubgrupoController{},
			),
		),

		beego.NSNamespace("/subgrupo_subgrupo",
			beego.NSInclude(
				&controllers.SubgrupoSubgrupoController{},
			),
		),

		beego.NSNamespace("/detalle_subgrupo",
			beego.NSInclude(
				&controllers.DetalleSubgrupoController{},
			),
		),

		beego.NSNamespace("/tipo_nivel",
			beego.NSInclude(
				&controllers.TipoNivelController{},
			),
		),

		beego.NSNamespace("/tipo_bien",
			beego.NSInclude(
				&controllers.TipoBienController{},
			),
		),

		beego.NSNamespace("/tr_grupo",
			beego.NSInclude(
				&controllers.TrGrupoController{},
			),
		),

		beego.NSNamespace("/tr_subgrupo",
			beego.NSInclude(
				&controllers.TrSubgrupoController{},
			),
		),

		beego.NSNamespace("/tr_catalogo",
			beego.NSInclude(
				&controllers.TrCatalogoController{},
			),
		),
		beego.NSNamespace("/tr_cuentas_subgrupo",
			beego.NSInclude(
				&controllers.TrCuentasSubgrupoController{},
			),
		),
	)
	beego.AddNamespace(ns)
}
