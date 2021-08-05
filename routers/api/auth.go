package api

import (
	"gin-blog/models"
	"gin-blog/pkg/e"
	"gin-blog/pkg/logging"
	"gin-blog/pkg/util"
	"net/http"

	"github.com/astaxie/beego/validation"
	"github.com/gin-gonic/gin"
)

func CheckAuth(c *gin.Context) {
	data := make(map[string]interface{})
	valid := validation.Validation{}
	code := e.INVALID_PARAMS
	username := c.Query("username")
	password := c.Query("password")

	valid.Required(username, "username").Message("用户名不能为空")
	valid.Required(password, "password").Message("密码不能为空")

	if !valid.HasErrors() {
		if isExist := models.CheckAuth(username, password); isExist {
			token, err := util.GenerateToken(username, password)
			if err != nil {
				code = e.ERROR_AUTH_TOKEN
			} else {
				data["token"] = token
				code = e.SUCCESS
			}
		} else {
			code = e.ERROR_AUTH
		}
	} else {
		for _, err := range valid.Errors {
			logging.Info(err)
		}
	}

	c.JSON(http.StatusOK, gin.H{
		"code": code,
		"msg":  e.GetMsg(code),
		"data": data,
	})
}

func AddAuth(c *gin.Context) {
	valid := validation.Validation{}
	data := make(map[string]interface{})
	code := e.INVALID_PARAMS
	username := c.PostForm("username")
	password := c.PostForm("password")

	valid.Required(username, "username").Message("用户名不能为空")
	valid.MinSize(username, 6, "username").Message("用户名最少6个字符")
	valid.MaxSize(username, 20, "username").Message("用户名最厂20个字符")
	valid.Required(password, "password").Message("密码不能为空")
	valid.MinSize(password, 6, "password").Message("密码最少6个字符")

	if !valid.HasErrors() {
		if !models.ExistAuthByUsername(username) {
			var pwd []byte = []byte(password)
			password = util.HashAndSalt(pwd)
			models.AddAuth(username, password)
			code = e.SUCCESS
		} else {
			code = e.ERROR_EXIST_AUTH
		}
	} else {
		for _, err := range valid.Errors {
			logging.Info(err)
		}
	}

	c.JSON(http.StatusOK, gin.H{
		"code": code,
		"msg":  e.GetMsg(code),
		"data": data,
	})
}
