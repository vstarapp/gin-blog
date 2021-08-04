package main

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

type Person struct {
	Name    string `from:"name"`
	Address string `from:"address"`
}

func main() {
	route := gin.Default()

	route.GET("/testing", startPage)
	route.Run()
}

func startPage(c *gin.Context) {
	var person Person
	if err := c.ShouldBindQuery(&person); err == nil {
		log.Println("===Onle Bind by Query String===")
		log.Println(person.Name)
		log.Println(person.Address)
	} else {
		log.Fatal(err)
	}

	c.String(http.StatusOK, "Success")
}
