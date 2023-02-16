package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type UmbralesPesos_20230124_120236 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &UmbralesPesos_20230124_120236{}
	m.Created = "20230124_120236"

	migration.Register("UmbralesPesos_20230124_120236", m)
}

// Run the migrations
func (m *UmbralesPesos_20230124_120236) Up() {
	file, err := ioutil.ReadFile("../scripts/20230124_120236_umbrales_pesos_up.sql")

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
func (m *UmbralesPesos_20230124_120236) Down() {
	file, err := ioutil.ReadFile("../scripts/20230124_120236_umbrales_pesos_down.sql")

	if err != nil {
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";\n")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
	}
}
