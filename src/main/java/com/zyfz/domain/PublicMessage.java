package com.zyfz.domain;

import java.util.Date;

public class PublicMessage {
    private Integer id;

    private String pmTitle;

    private String pmContent;

    private Date pmCreateTime;

    public PublicMessage() {
        super();
    }

    public PublicMessage(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPmTitle() {
        return pmTitle;
    }

    public void setPmTitle(String pmTitle) {
        this.pmTitle = pmTitle;
    }

    public String getPmContent() {
        return pmContent;
    }

    public void setPmContent(String pmContent) {
        this.pmContent = pmContent;
    }

    public Date getPmCreateTime() {
        return pmCreateTime;
    }

    public void setPmCreateTime(Date pmCreateTime) {
        this.pmCreateTime = pmCreateTime;
    }
}