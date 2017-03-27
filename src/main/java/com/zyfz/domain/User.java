package com.zyfz.domain;

import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class User {
    private Integer id;

    private String username;

    private String phone;

    private String password;

    private String salt;

    private Boolean isLocked; //0锁定，1未锁定

    private String roleIds;  //角色ID

    private String organization; //组织，预留字段

    private String nickname;   //昵称

    private String realName;   //真实名字

    private String userIdentify;  //用户省份证

    private String country;  //国家

    private String province; //省

    private String city; //城

    private String area; //区

    private String street; //街道

    private String currentArea; //详细地址

    private Boolean isAdmin; //是否管理员

    private Boolean isNew; //是否新用户，新用户拥有新用户特权

    private Date createTime;

    private Double account; //账户金额

    private Double contributeScore; //贡献值

    private Double honerScore; //荣誉值

    private Double gradeTotal;  //评星总分

    private Integer gradeTimes; //评星次数

    private String withdrawAccount;  //体现账户

    private String wirhdrawAccontType; //体现账户类型

    private String regid; //推送标识

    private String alias; //推送标识

    private String topic; //推送标识

    private List<Role> roles;

    private String email;

    private String photo; //头像

    private String cookie; //存储sessionId

    private String captcha; //验证码

    private String newPassword;

    private String description;

    public User() {
        super();
    }

    public User(Integer id) {
        this.id = id;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }

    public String getCookie() {
        return cookie;
    }

    public void setCookie(String cookie) {
        this.cookie = cookie;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Boolean getIsLocked() {
        return isLocked;
    }

    public void setIsLocked(Boolean isLocked) {
        this.isLocked = isLocked;
    }

    public String getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String roleIds) {
        this.roleIds = roleIds;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getUserIdentify() {
        return userIdentify;
    }

    public void setUserIdentify(String userIdentify) {
        this.userIdentify = userIdentify;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getCurrentArea() {
        return currentArea;
    }

    public void setCurrentArea(String currentArea) {
        this.currentArea = currentArea;
    }

    public Boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public Boolean getIsNew() {
        return isNew;
    }

    public void setIsNew(Boolean isNew) {
        this.isNew = isNew;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Double getAccount() {
        return account;
    }

    public void setAccount(Double account) {
        this.account = account;
    }

    public Double getContributeScore() {
        return contributeScore;
    }

    public void setContributeScore(Double contributeScore) {
        this.contributeScore = contributeScore;
    }

    public Double getHonerScore() {
        return honerScore;
    }

    public void setHonerScore(Double honerScore) {
        this.honerScore = honerScore;
    }

    public Double getGradeTotal() {
        return gradeTotal;
    }

    public void setGradeTotal(Double gradeTotal) {
        this.gradeTotal = gradeTotal;
    }

    public Integer getGradeTimes() {
        return gradeTimes;
    }

    public void setGradeTimes(Integer gradeTimes) {
        this.gradeTimes = gradeTimes;
    }

    public String getWithdrawAccount() {
        return withdrawAccount;
    }

    public void setWithdrawAccount(String withdrawAccount) {
        this.withdrawAccount = withdrawAccount;
    }

    public String getWirhdrawAccontType() {
        return wirhdrawAccontType;
    }

    public void setWirhdrawAccontType(String wirhdrawAccontType) {
        this.wirhdrawAccontType = wirhdrawAccontType;
    }

    public String getRegid() {
        return regid;
    }

    public void setRegid(String regid) {
        this.regid = regid;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getCredentialsSalt() {
        return username + salt;
    }

    public Integer getGrade(){
        if(gradeTimes==null || gradeTimes == 0){
            gradeTimes = 1;
        }
        if(gradeTotal == null || gradeTotal == 0){
            gradeTotal = 0d;
        }
        return (gradeTotal.intValue())/gradeTimes;
    }

    public String getContactAddress(){
        List<String> address = new ArrayList<String>();
        address.add(country);
        if (province != null){
            address.add(province);
        }
        if (city != null){
            address.add(city);
        }
        if (area != null){
            address.add(area);
        }
        if (street != null){
            address.add(street);
        }
        if (currentArea != null){
            address.add(currentArea);
        }
        if (address == null){
            address.add("未知");
        }
       return StringUtils.collectionToDelimitedString(address,",");
    }

}