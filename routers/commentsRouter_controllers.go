package routers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context/param"
)

func init() {

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: `/`,
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: `/`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: `/:id`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: `/:id`,
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: `/:id`,
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasGrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasGrupoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: `/`,
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasGrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasGrupoController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: `/`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasGrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasGrupoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: `/:id`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasGrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasGrupoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: `/:id`,
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasGrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasGrupoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: `/:id`,
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: `/`,
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: `/`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: `/:id`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: `/:id`,
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: `/:id`,
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: `/`,
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: `/`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: `/:id`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: `/:id`,
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: `/:id`,
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: `/`,
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: `/`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: `/:id`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: `/:id`,
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: `/:id`,
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: `/`,
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: `/`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: `/:id`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: `/:id`,
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: `/:id`,
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"],
        beego.ControllerComments{
            Method: "Post",
            Router: `/`,
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: `/`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: `/:id`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"],
        beego.ControllerComments{
            Method: "Put",
            Router: `/:id`,
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: `/:id`,
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

}
