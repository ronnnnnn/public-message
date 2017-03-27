package com.zyfz.model;

/**
 * Created by ron on 16-10-21.
 */
public class ResourceModel {
    private int id; //编号
    private String name; //资源名称
    private Long parentId; //父编号
    private Boolean check;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Boolean getCheck() {
        return check;
    }

    public void setCheck(Boolean check) {
        this.check = check;
    }

    public boolean isRootNode() {
        return parentId == 0;
    }
}
