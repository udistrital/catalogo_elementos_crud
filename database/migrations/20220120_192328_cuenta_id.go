package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type CuentaId_20220120_192328 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &CuentaId_20220120_192328{}
	m.Created = "20220120_192328"

	migration.Register("CuentaId_20220120_192328", m)
}

// Run the migrations
func (m *CuentaId_20220120_192328) Up() {
	file, err := ioutil.ReadFile("../scripts/20220120_192328_cuenta_id_up.sql")

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
func (m *CuentaId_20220120_192328) Down() {
	file, err := ioutil.ReadFile("../scripts/20220120_192328_cuenta_id_down.sql")

	if err != nil {
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";\n")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
	}
}
