package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type CambioTipoCodigo_20201125_110439 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &CambioTipoCodigo_20201125_110439{}
	m.Created = "20201125_110439"

	migration.Register("CambioTipoCodigo_20201125_110439", m)
}

// Run the migrations
func (m *CambioTipoCodigo_20201125_110439) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	file, err := ioutil.ReadFile("../scripts/cambio_tipo_codigo.up.sql")

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
func (m *CambioTipoCodigo_20201125_110439) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	file, err := ioutil.ReadFile("../scripts/cambio_tipo_codigo.down.sql")

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
