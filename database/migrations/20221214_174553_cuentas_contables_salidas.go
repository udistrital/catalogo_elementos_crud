package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type CuentasContablesSalidas_20221214_174553 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &CuentasContablesSalidas_20221214_174553{}
	m.Created = "20221214_174553"

	migration.Register("CuentasContablesSalidas_20221214_174553", m)
}

// Run the migrations
func (m *CuentasContablesSalidas_20221214_174553) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	file, err := ioutil.ReadFile("../scripts/20221214_174553_cuentas_contables_salidas_up.sql")

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
func (m *CuentasContablesSalidas_20221214_174553) Down() {
	file, err := ioutil.ReadFile("../scripts/20221214_174553_cuentas_contables_salidas_down.sql")

	if err != nil {
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";\n")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
	}
}
