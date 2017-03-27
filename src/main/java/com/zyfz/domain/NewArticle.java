package com.zyfz.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NewArticle {
    private Integer id;

    private String title;

    private String content;

    private Date createTime;

    private String type;

    private Integer clickTimes;

    private Integer hhCategoryId;

    private Boolean isShow;

    private String paper;

    private String date;

    public NewArticle() {
        super();
    }

    public NewArticle(Integer id) {
        this.id = id;
    }


    public Boolean getIsShow() {
        return isShow;
    }

    public void setIsShow(Boolean show) {
        isShow = show;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getClickTimes() {
        return clickTimes;
    }

    public void setClickTimes(Integer clickTimes) {
        this.clickTimes = clickTimes;
    }

    public Integer getHhCategoryId() {
        return hhCategoryId;
    }

    public void setHhCategoryId(Integer hhCategoryId) {
        this.hhCategoryId = hhCategoryId;
    }

    public String getPaper() {
        return paper;
    }

    public void setPaper(String paper) {
        this.paper = paper;
    }

    public String getUrl(){
        if(id != null){
            return "/ps/client/api/v1/anon/art/detail/"+id;
        } else {
            return null;
        }
    }

    public String getDateTime(){
        if (createTime != null){
            SimpleDateFormat smf = new SimpleDateFormat("yyyy MM dd HH:mm:ss");
            String mydate = smf.format(createTime);
            return mydate;
        } else {
            return null;
        }
    }
}