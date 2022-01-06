package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AgregarCampoPoliza_20220105_164431 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AgregarCampoPoliza_20220105_164431{}
	m.Created = "20220105_164431"

	migration.Register("AgregarCampoPoliza_20220105_164431", m)
}

// Run the migrations
func (m *AgregarCampoPoliza_20220105_164431) Up() {
	file, err := ioutil.ReadFile("../scripts/20220105_164431_agregar_campo_poliza_up.sql")

	if err != nil {
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
	}
	// use m.SQL("CREATE TABLE ...") to make schema update

}

// Reverse the migrations
func (m *AgregarCampoPoliza_20220105_164431) Down() {
	file, err := ioutil.ReadFile("../scripts/20220105_164431_agregar_campo_poliza_down.sql")
	if err != nil {
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
	}
	// use m.SQL("DROP TABLE ...") to reverse schema update

}
