package com.zyfz.domain;

import java.util.Date;

public class H5Manage {
    private Integer id;

    private String h5Name;

    private String h5Url;

    private Date createTime;

    public H5Manage() {
        super();
    }

    public H5Manage(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getH5Name() {
        return h5Name;
    }

    public void setH5Name(String h5Name) {
        this.h5Name = h5Name;
    }

    public String getH5Url() {
        return h5Url;
    }

    public void setH5Url(String h5Url) {
        this.h5Url = h5Url;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}