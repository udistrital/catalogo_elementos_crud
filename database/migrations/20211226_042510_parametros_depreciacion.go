package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type ParametrosDepreciacion_20211226_042510 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &ParametrosDepreciacion_20211226_042510{}
	m.Created = "20211226_042510"

	migration.Register("ParametrosDepreciacion_20211226_042510", m)
}

// Run the migrations
func (m *ParametrosDepreciacion_20211226_042510) Up() {
	file, err := ioutil.ReadFile("../scripts/20211226_042510_parametros_depreciacion_up.sql")

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
func (m *ParametrosDepreciacion_20211226_042510) Down() {
	file, err := ioutil.ReadFile("../scripts/20211226_042510_parametros_depreciacion_down.sql")

	if err != nil {
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";\n")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
	}
}
