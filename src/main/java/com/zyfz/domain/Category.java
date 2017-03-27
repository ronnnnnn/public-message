package com.zyfz.domain;

/**
 * 类别表
 */
public class Category {
    private Integer id;

    private String categoryName; //类别名字

    private String categoryCode; //类别编码

    private Integer parentId; //父类别id

    private String parentIds;

    private Integer priority; //优先级

    private String description; //描述

    private String topic;

    public Category() {
        super();
    }

    public Category(Integer id) {
        this.id = id;
    }

    public Category(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isRootNode() {
        return parentId == 0;
    }

    public String makeSelfAsParentIds() {
        return getParentIds() + getId() + "/";
    }

    public String getUrl(){
        if (id != null){
            return "/ps/client/api/v1/anon/article/"+ id;
        } else {
            return null;
        }
    }
}