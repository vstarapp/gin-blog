package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/someGet", getting)
	r.POST("/somePost", posting)
	r.PUT("/somePut", putting)
	r.OPTIONS("/someOptions", options)
	r.DELETE("/someDelete", deleting)
	r.PATCH("/somePatch", patching)
	r.HEAD("/someHead", head)

}

func getting(c *gin.Context) {

}

func posting(c *gin.Context) {

}

func putting(c *gin.Context) {

}
