package com.zyfz.domain;

import java.util.Date;

/**
 * 轮播图，广告页等设置
 */

public class Show {
    private Integer id;
    private String mname; //图片名字
    private String imageUrl; //图片url
    private String  mtype; //图片类型
    private Integer sort; //图片排序
    private Boolean isUse; //是否使用
    private Date createTime;
    private String relateUrl;
    private String relateArticleTitle;

    public String getRelateUrl() {
        return relateUrl;
    }

    public void setRelateUrl(String relateUrl) {
        this.relateUrl = relateUrl;
    }

    public String getRelateArticleTitle() {
        return relateArticleTitle;
    }

    public void setRelateArticleTitle(String relateArticleTitle) {
        this.relateArticleTitle = relateArticleTitle;
    }

    public String getMtype() {
        return mtype;
    }

    public void setMtype(String mtype) {
        this.mtype = mtype;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Boolean getIsUse() {
        return isUse;
    }

    public void setIsUse(Boolean use) {
        isUse = use;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}