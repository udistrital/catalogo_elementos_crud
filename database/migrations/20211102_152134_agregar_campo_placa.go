package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AgregarCampoPlaca_20211102_152134 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AgregarCampoPlaca_20211102_152134{}
	m.Created = "20211102_152134"

	migration.Register("AgregarCampoPlaca_20211102_152134", m)
}

// Run the migrations
func (m *AgregarCampoPlaca_20211102_152134) Up() {
	file, err := ioutil.ReadFile("../scripts/agregar_campo_placa_up.sql")

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
func (m *AgregarCampoPlaca_20211102_152134) Down() {
	file, err := ioutil.ReadFile("../scripts/agregar_campo_placa_down.sql")
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
