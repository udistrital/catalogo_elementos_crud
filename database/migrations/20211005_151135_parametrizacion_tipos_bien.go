package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type ParametrizacionTiposBien_20211005_151135 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &ParametrizacionTiposBien_20211005_151135{}
	m.Created = "20211005_151135"

	migration.Register("ParametrizacionTiposBien_20211005_151135", m)
}

// Run the migrations
func (m *ParametrizacionTiposBien_20211005_151135) Up() {
	file, err := ioutil.ReadFile("../scripts/parametrizacion_tipos_bien.up.sql")

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
func (m *ParametrizacionTiposBien_20211005_151135) Down() {
	file, err := ioutil.ReadFile("../scripts/parametrizacion_tipos_bien.down.sql")
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
