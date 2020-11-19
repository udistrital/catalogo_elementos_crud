package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type CatalogoElementosCrud_20201118_161813 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &CatalogoElementosCrud_20201118_161813{}
	m.Created = "20201118_161813"

	migration.Register("CatalogoElementosCrud_20201118_161813", m)
}

// Run the migrations
func (m *CatalogoElementosCrud_20201118_161813) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	file, err := ioutil.ReadFile("../scripts/crear_tablas_catalogo.up.sql")

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
func (m *CatalogoElementosCrud_20201118_161813) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	file, err := ioutil.ReadFile("../scripts/crear_tablas_catalogo.down.sql")

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
