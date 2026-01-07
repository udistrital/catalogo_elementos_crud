package main

import (
	"context"
	"errors"
	"fmt"
	"net/url"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
	"github.com/astaxie/beego/orm"
	"github.com/astaxie/beego/plugins/cors"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/ssm"
	_ "github.com/lib/pq"

	_ "github.com/udistrital/catalogo_elementos_crud/routers"
	apistatus "github.com/udistrital/utils_oas/apiStatusLib"
	"github.com/udistrital/utils_oas/auditoria"
	"github.com/udistrital/utils_oas/customerrorv2"
	"github.com/udistrital/utils_oas/security"
	"github.com/udistrital/utils_oas/xray"
)

func main() {
	conn, err := buildPostgresConnectionString()
	if err != nil {
		logs.Error("error consultando la cadena de conexión: %v", err)
		return
	}

	err = orm.RegisterDataBase("default", "postgres", conn)
	if err != nil {
		logs.Error("error al conectarse a la base de datos: %v", err)
		return
	}

	allowedOrigins := []string{"*.udistrital.edu.co"}
	if beego.BConfig.RunMode == beego.DEV {
		allowedOrigins = []string{"*"}
		orm.Debug = true
		beego.BConfig.WebConfig.DirectoryIndex = true
		beego.BConfig.WebConfig.StaticDir["/swagger"] = "swagger"
	}

	beego.InsertFilter("*", beego.BeforeRouter, cors.Allow(&cors.Options{
		AllowOrigins: allowedOrigins,
		AllowMethods: []string{"DELETE", "GET", "OPTIONS", "POST", "PUT"},
		AllowHeaders: []string{
			"Accept",
			"Authorization",
			"Content-Type",
			"User-Agent",
			"X-Amzn-Trace-Id"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))

	err = xray.InitXRay()
	if err != nil {
		logs.Error("error configurando AWS XRay: %v", err)
	}
	apistatus.Init()
	auditoria.InitMiddleware()
	beego.ErrorController(&customerrorv2.CustomErrorController{})
	security.SetSecurityHeaders()
	beego.Run()
}

func buildPostgresConnectionString() (string, error) {
	parameterPrefix := beego.AppConfig.String("parameterStore")
	if parameterPrefix == "" {
		logs.Info("usando credenciales locales para la conexión a la base de datos")
		return formatPostgresConnectionString(beego.AppConfig.String("PGuser"), beego.AppConfig.String("PGpass")), nil
	}

	parameterBasePath := beego.AppConfig.String("appname") + "/db/"

	username, err := getParameterFromParameterStore(context.Background(), parameterBasePath+"username")
	if err != nil {
		logs.Critical("error consultando username: %v", err)
		return "", errors.New("error consultando credenciales: " + err.Error())
	}

	password, err := getParameterFromParameterStore(context.Background(), parameterBasePath+"password")
	if err != nil {
		logs.Critical("error consultando credenciales: %v", err)
		return "", errors.New("error consultando credenciales: " + err.Error())
	}

	conn := formatPostgresConnectionString(username, password)

	return conn, nil
}

func getParameterFromParameterStore(ctx context.Context, name string) (string, error) {
	parameterName := addPrefix(name)

	cfg, err := config.LoadDefaultConfig(ctx)
	if err != nil {
		return "", fmt.Errorf("unable to load SDK config: %w", err)
	}

	ssmClient := ssm.NewFromConfig(cfg)
	output, err := ssmClient.GetParameter(ctx, &ssm.GetParameterInput{
		Name:           aws.String(parameterName),
		WithDecryption: aws.Bool(true),
	})
	if err != nil {
		return "", fmt.Errorf("ocurrió un error al consultar el parámetro: %w", err)
	}

	return *output.Parameter.Value, nil
}

func addPrefix(path string) string {
	parameterPrefix := beego.AppConfig.String("parameterStore")
	if parameterPrefix != "" {
		return "/" + parameterPrefix + "/" + path
	}
	return path
}

func formatPostgresConnectionString(username, password string) string {
	return "postgres://" + username + ":" + url.QueryEscape(password) + "@" + beego.AppConfig.String("PGhost") + ":" + beego.AppConfig.String("PGport") + "/" + beego.AppConfig.String("PGdb") + "?sslmode=disable&search_path=" + beego.AppConfig.String("PGschema")
}
