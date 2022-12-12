package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type UmbralTiposBien_20220927_164332 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &UmbralTiposBien_20220927_164332{}
	m.Created = "20220927_164332"

	migration.Register("UmbralTiposBien_20220927_164332", m)
}

// Run the migrations
func (m *UmbralTiposBien_20220927_164332) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	file, err := ioutil.ReadFile("../scripts/20220927_164332_umbral_tipos_bien_up.sql")

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
func (m *UmbralTiposBien_20220927_164332) Down() {
	file, err := ioutil.ReadFile("../scripts/20220927_164332_umbral_tipos_bien_down.sql")

	if err != nil {
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";\n")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
	}
}
