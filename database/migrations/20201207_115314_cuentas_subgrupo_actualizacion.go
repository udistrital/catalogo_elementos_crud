package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type CuentasSubgrupoActualizacion_20201207_115314 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &CuentasSubgrupoActualizacion_20201207_115314{}
	m.Created = "20201207_115314"

	migration.Register("CuentasSubgrupoActualizacion_20201207_115314", m)
}

// Run the migrations
func (m *CuentasSubgrupoActualizacion_20201207_115314) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	file, err := ioutil.ReadFile("../scripts/actualizacion_cuentas_subgrupo.up.sql")

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
func (m *CuentasSubgrupoActualizacion_20201207_115314) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	file, err := ioutil.ReadFile("../scripts/actualizacion_cuentas_subgrupo.down.sql")

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
