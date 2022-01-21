// Modelos generales, principalmente para efectos del Swagger

package models

type RamaArbolGenerica struct {
	Data     interface{}         `json:"data,omitempty"`
	Children []RamaArbolGenerica `json:"children,omitempty"`
}

type RamaArbolSubgrupo struct {
	Data     Subgrupo            `json:"data,omitempty"`
	Children []RamaArbolSubgrupo `json:"children,omitempty"`
}

type NodoGenerico struct {
	Expandible bool        `json:"expandible,omitempty"`
	Data       interface{} `json:"data,omitempty"`
}

type SubgrupoDetalle1 struct {
	Subgrupo *Subgrupo
	Detalle  *DetalleSubgrupo
}
