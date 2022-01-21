package routers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context/param"
)

func init() {

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: "/",
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: "/",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: "/:id",
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CatalogoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: "/:id",
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasSubgrupoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: "/",
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasSubgrupoController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: "/",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasSubgrupoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasSubgrupoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: "/:id",
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:CuentasSubgrupoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: "/:id",
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:DetalleSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:DetalleSubgrupoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: "/",
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:DetalleSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:DetalleSubgrupoController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: "/",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:DetalleSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:DetalleSubgrupoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:DetalleSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:DetalleSubgrupoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: "/:id",
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:DetalleSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:DetalleSubgrupoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: "/:id",
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: "/",
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: "/",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: "/:id",
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:ElementoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: "/:id",
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:RelacionNivelController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:RelacionNivelController"],
        beego.ControllerComments{
            Method: "Post",
            Router: "/",
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:RelacionNivelController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:RelacionNivelController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: "/",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:RelacionNivelController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:RelacionNivelController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:RelacionNivelController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:RelacionNivelController"],
        beego.ControllerComments{
            Method: "Put",
            Router: "/:id",
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: "/",
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: "/",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: "/:id",
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoCatalogoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: "/:id",
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: "/",
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: "/",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: "/:id",
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: "/:id",
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: "/",
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: "/",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: "/:id",
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:SubgrupoSubgrupoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: "/:id",
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"],
        beego.ControllerComments{
            Method: "Post",
            Router: "/",
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: "/",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"],
        beego.ControllerComments{
            Method: "Put",
            Router: "/:id",
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoBienController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: "/:id",
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoNivelController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoNivelController"],
        beego.ControllerComments{
            Method: "Post",
            Router: "/",
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoNivelController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoNivelController"],
        beego.ControllerComments{
            Method: "GetAll",
            Router: "/",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoNivelController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoNivelController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoNivelController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoNivelController"],
        beego.ControllerComments{
            Method: "Put",
            Router: "/:id",
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoNivelController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TipoNivelController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: "/:id",
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrCatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrCatalogoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrCatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrCatalogoController"],
        beego.ControllerComments{
            Method: "TreeCatalogo",
            Router: "/arbol",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrCatalogoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrCatalogoController"],
        beego.ControllerComments{
            Method: "GetSubgruposTipo_Bien",
            Router: "/tipo_de_bien/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrCuentasSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrCuentasSubgrupoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: "/",
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrCuentasSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrCuentasSubgrupoController"],
        beego.ControllerComments{
            Method: "GetAllById",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrCuentasSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrCuentasSubgrupoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: "/:id",
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrGrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrGrupoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: "/",
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrGrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrGrupoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrSubgrupoController"],
        beego.ControllerComments{
            Method: "Post",
            Router: "/",
            AllowHTTPMethods: []string{"post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrSubgrupoController"],
        beego.ControllerComments{
            Method: "GetOne",
            Router: "/:id",
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrSubgrupoController"] = append(beego.GlobalControllerRouter["github.com/udistrital/catalogo_elementos_crud/controllers:TrSubgrupoController"],
        beego.ControllerComments{
            Method: "Put",
            Router: "/:id",
            AllowHTTPMethods: []string{"put"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

}
