package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type CrearTablaRelacionNivel_20201120_121608 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &CrearTablaRelacionNivel_20201120_121608{}
	m.Created = "20201120_121608"

	migration.Register("CrearTablaRelacionNivel_20201120_121608", m)
}

// Run the migrations
func (m *CrearTablaRelacionNivel_20201120_121608) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	file, err := ioutil.ReadFile("../scripts/crear_tabla_relacion_nivel.up.sql")

	if err != nil {
		// handle error
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
	}
}

// Reverse the migrations
func (m *CrearTablaRelacionNivel_20201120_121608) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	file, err := ioutil.ReadFile("../scripts/crear_tabla_relacion_nivel.down.sql")

	if err != nil {
		// handle error
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
		// do whatever you need with result and error
	}
}
