package main

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
	"github.com/astaxie/beego/orm"
	"github.com/astaxie/beego/plugins/cors"
	_ "github.com/lib/pq"

	_ "github.com/udistrital/catalogo_elementos_crud/routers"
	apistatus "github.com/udistrital/utils_oas/apiStatusLib"
	"github.com/udistrital/utils_oas/auditoria"
	"github.com/udistrital/utils_oas/customerror"
	"github.com/udistrital/utils_oas/database"
	"github.com/udistrital/utils_oas/security"
	"github.com/udistrital/utils_oas/xray"
)

func main() {
	conn, err := database.BuildPostgresConnectionString()
	if err != nil {
		logs.Error("error consultando la cadena de conexión: %v", err)
		return
	}

	err = orm.RegisterDataBase("default", "postgres", conn)
	if err != nil {
		logs.Error("error al conectarse a la base de datos: %v", err)
		return
	}

	AllowedOrigins := []string{"*.udistrital.edu.co"}
	if beego.BConfig.RunMode == "dev" {
		AllowedOrigins = []string{"*"}
		orm.Debug = true
		beego.BConfig.WebConfig.DirectoryIndex = true
		beego.BConfig.WebConfig.StaticDir["/swagger"] = "swagger"
	}
	beego.InsertFilter("*", beego.BeforeRouter, cors.Allow(&cors.Options{
		AllowOrigins: AllowedOrigins,
		AllowMethods: []string{"PUT", "PATCH", "GET", "POST", "OPTIONS", "DELETE"},
		AllowHeaders: []string{"Origin", "x-requested-with",
			"content-type",
			"accept",
			"origin",
			"authorization",
			"x-csrftoken"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))

	err = xray.InitXRay()
	if err != nil {
		logs.Error("error configurando AWS XRay: %v", err)
	}
	apistatus.Init()
	auditoria.InitMiddleware()
	beego.ErrorController(&customerror.CustomErrorController{})
	security.SetSecurityHeaders()
	beego.Run()
}
