package models

import (
	"time"

	"gorm.io/gorm"
)

type Article struct {
	Model
	TagId      int `json:"tag_id" gorm:"index"`
	Tag        Tag
	Title      string `json:"title"`
	Desc       string `json:"desc"`
	Content    string `json:"content"`
	CreatedBy  string `json:"created_by"`
	ModifiedBy string `json:"modified_by"`
	State      int    `json:"state"`
	CreatedOn  int    `json:"created_on"`
}

func GetArticles(pageNum int, PageSize int, maps interface{}) (articles []Article) {
	db.Select("title").Where(maps).Offset(pageNum).Limit(PageSize).Find(&articles)

	return
}

func GetArticle(id int) (article Article) {
	db.Preload("Tag").Where("id = ?", id).First(&article)

	return
}

func GetArticleTotal(maps interface{}) (count int64) {
	db.Model(&Article{}).Where(maps).Count(&count)

	return count
}

func ExistArticleById(id int) bool {
	var article Article
	db.Select("id").Where("id = ?", id).First(&article)
	if article.ID > 0 {
		return true
	}

	return false
}

func AddArticle(data map[string]interface{}) bool {
	db.Create(&Article{
		TagId:     data["tag_id"].(int),
		Title:     data["title"].(string),
		Desc:      data["desc"].(string),
		Content:   data["content"].(string),
		CreatedBy: data["created_by"].(string),
		State:     data["state"].(int),
	})

	return true
}

func EditArticle(id int, data map[string]interface{}) bool {
	db.Model(&Article{}).Where("id = ?", id).Updates(data)

	return true
}

func DeleteArticle(id int) bool {
	db.Where("id = ?", id).Delete(&Article{})

	return true
}

func (article *Article) BeforeCreate(tx *gorm.DB) (err error) {
	article.Model.CreatedOn = int(time.Now().Unix())

	return nil
}

func (article *Article) BeforeSave(tx *gorm.DB) (err error) {
	article.Model.ModifiedOn = int(time.Now().Unix())
	return nil
}

// 硬删除
func CleanAllArticle() bool {
	db.Unscoped().Where("deleted != ", 0).Delete(&Article{})

	return true
}
