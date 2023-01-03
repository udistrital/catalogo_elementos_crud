package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type MovimientosCuentas_20221216_153602 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &MovimientosCuentas_20221216_153602{}
	m.Created = "20221216_153602"

	migration.Register("MovimientosCuentas_20221216_153602", m)
}

// Run the migrations
func (m *MovimientosCuentas_20221216_153602) Up() {
	file, err := ioutil.ReadFile("../scripts/20221216_153602_movimientos_cuentas_up.sql")

	if err != nil {
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";\n")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
	}
}

// Reverse the migrations
func (m *MovimientosCuentas_20221216_153602) Down() {
	file, err := ioutil.ReadFile("../scripts/20221216_153602_movimientos_cuentas_down.sql")

	if err != nil {
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";\n")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
	}
}
