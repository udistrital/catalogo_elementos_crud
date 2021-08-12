package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AgregarCodigoElementos_20210806_001704 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AgregarCodigoElementos_20210806_001704{}
	m.Created = "20210806_001704"

	migration.Register("AgregarCodigoElementos_20210806_001704", m)
}

// Run the migrations
func (m *AgregarCodigoElementos_20210806_001704) Up() {
	file, err := ioutil.ReadFile("../scripts/20210806_001704_agregar_codigo_elementos_up.sql")

	if err != nil {
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
	}
}

// Reverse the migrations
func (m *AgregarCodigoElementos_20210806_001704) Down() {
	file, err := ioutil.ReadFile("../scripts/20210806_001704_agregar_codigo_elementos_down.sql")

	if err != nil {
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
	}
}
