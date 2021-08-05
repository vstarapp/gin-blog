package models

import (
	"log"
	"time"

	"gorm.io/gorm"
)

type Tag struct {
	Model
	Name       string `json:"name"`
	CreatedBy  string `json:"created_by"`
	ModifiedBy string `json:"modified_by"`
	State      int    `json:"state"`
}

func GetTags(pageNum int, PageSize int, maps interface{}) (tags []Tag) {
	db.Where(maps).Offset(pageNum).Limit(PageSize).Find(&tags)
	return
}

func GetTageTotal(maps interface{}) (count int64) {
	db.Model(&Tag{}).Where(maps).Count(&count)

	return
}

func ExistTagByName(name string, id int) bool {
	var tag Tag
	if id != 0 {
		db.Select("id").Where("name=? and id <> ?", name, id).First(&tag)
	} else {
		db.Select("id").Where("name=?", name).First(&tag)
	}

	if tag.ID > 0 {
		return true
	}

	return false
}

func ExistTagById(id int) bool {
	var tag Tag
	db.Select("id").Where("id=?", id).First(&tag)
	if tag.ID > 0 {
		return true
	}

	return false
}

func AddTag(name string, state int, CreatedBy string) bool {
	db.Create(&Tag{
		Name:      name,
		State:     state,
		CreatedBy: CreatedBy,
	})

	return true
}

func DeleteTag(id int) bool {
	db.Where("id=?", id).Delete(&Tag{})

	return true
}

func EditTag(id int, data interface{}) bool {
	// var tag Tag
	// tag.ID = id
	// result := db.Model(&tag).Updates(&data)
	result := db.Model(&Tag{}).Where("id=?", id).Updates(data)
	log.Printf("result%d", result.RowsAffected)
	if result.RowsAffected > 0 {
		return true
	}
	return false
}

func (tag *Tag) BeforeCreate(tx *gorm.DB) (err error) {
	tag.Model.CreatedOn = int(time.Now().Unix())

	return nil
}

func (tag *Tag) BeforeUpdate(tx *gorm.DB) (err error) {
	if tx.Statement.Changed() {
		tx.Statement.SetColumn("ModifiedOn", time.Now().Unix())
	}
	return nil
	// tag.Model.ModifiedOn = int(time.Now().Unix())
	// tag.Model.CreatedOn = 123

	// return nil
}

// 硬删除
func CleanAllTag() bool {
	db.Unscoped().Where("deleted != ", 0).Delete(&Tag{})

	return true
}
