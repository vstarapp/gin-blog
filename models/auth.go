package models

import (
	"gin-blog/pkg/util"
	"time"

	"gorm.io/gorm"
)

type Auth struct {
	ID        int    `gorm:"primary_key" json:"id"`
	Username  string `json:"username"`
	Password  string `json:"password"`
	CreatedOn int    `json:"created_on"`
}

// 检查用户名密码
func CheckAuth(username string, password string) bool {
	var auth Auth
	db.Select("id,password").Where(Auth{Username: username}).First(&auth)
	if auth.ID > 0 {
		pwd := []byte(password)
		if util.ComparePasswords(auth.Password, pwd) {
			return true
		}
	}

	return false
}

// 添加账户
func AddAuth(username string, password string) bool {
	db.Create(&Auth{
		Username: username,
		Password: password,
	})

	return true
}

// 用户名是否已存在
func ExistAuthByUsername(username string) bool {
	var auth Auth
	db.Select("id").Where("username=?", username).First(&auth)
	if auth.ID > 0 {
		return true
	}

	return false
}

func (auth *Auth) BeforeCreate(tx *gorm.DB) (err error) {
	auth.CreatedOn = int(time.Now().Unix())

	return nil
}
