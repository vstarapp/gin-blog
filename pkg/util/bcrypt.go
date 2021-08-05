package util

import "golang.org/x/crypto/bcrypt"

// https://blog.csdn.net/weixin_39129128/article/details/107539629
// 加密密码
func HashAndSalt(pwd []byte) string {
	if hash, err := bcrypt.GenerateFromPassword(pwd, bcrypt.MinCost); err == nil {
		return string(hash)
	}

	return ""
}

// 验证密码
func ComparePasswords(hashedPwd string, plainPwd []byte) bool {
	byteHash := []byte(hashedPwd)
	err := bcrypt.CompareHashAndPassword(byteHash, plainPwd)
	if err != nil {
		return false
	}

	return true
}
