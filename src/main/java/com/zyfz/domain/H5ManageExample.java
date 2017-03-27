package com.zyfz.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class H5ManageExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public H5ManageExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getOffset() {
        return offset;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andH5NameIsNull() {
            addCriterion("h5_name is null");
            return (Criteria) this;
        }

        public Criteria andH5NameIsNotNull() {
            addCriterion("h5_name is not null");
            return (Criteria) this;
        }

        public Criteria andH5NameEqualTo(String value) {
            addCriterion("h5_name =", value, "h5Name");
            return (Criteria) this;
        }

        public Criteria andH5NameNotEqualTo(String value) {
            addCriterion("h5_name <>", value, "h5Name");
            return (Criteria) this;
        }

        public Criteria andH5NameGreaterThan(String value) {
            addCriterion("h5_name >", value, "h5Name");
            return (Criteria) this;
        }

        public Criteria andH5NameGreaterThanOrEqualTo(String value) {
            addCriterion("h5_name >=", value, "h5Name");
            return (Criteria) this;
        }

        public Criteria andH5NameLessThan(String value) {
            addCriterion("h5_name <", value, "h5Name");
            return (Criteria) this;
        }

        public Criteria andH5NameLessThanOrEqualTo(String value) {
            addCriterion("h5_name <=", value, "h5Name");
            return (Criteria) this;
        }

        public Criteria andH5NameLike(String value) {
            addCriterion("h5_name like", value, "h5Name");
            return (Criteria) this;
        }

        public Criteria andH5NameNotLike(String value) {
            addCriterion("h5_name not like", value, "h5Name");
            return (Criteria) this;
        }

        public Criteria andH5NameIn(List<String> values) {
            addCriterion("h5_name in", values, "h5Name");
            return (Criteria) this;
        }

        public Criteria andH5NameNotIn(List<String> values) {
            addCriterion("h5_name not in", values, "h5Name");
            return (Criteria) this;
        }

        public Criteria andH5NameBetween(String value1, String value2) {
            addCriterion("h5_name between", value1, value2, "h5Name");
            return (Criteria) this;
        }

        public Criteria andH5NameNotBetween(String value1, String value2) {
            addCriterion("h5_name not between", value1, value2, "h5Name");
            return (Criteria) this;
        }

        public Criteria andH5UrlIsNull() {
            addCriterion("h5_url is null");
            return (Criteria) this;
        }

        public Criteria andH5UrlIsNotNull() {
            addCriterion("h5_url is not null");
            return (Criteria) this;
        }

        public Criteria andH5UrlEqualTo(String value) {
            addCriterion("h5_url =", value, "h5Url");
            return (Criteria) this;
        }

        public Criteria andH5UrlNotEqualTo(String value) {
            addCriterion("h5_url <>", value, "h5Url");
            return (Criteria) this;
        }

        public Criteria andH5UrlGreaterThan(String value) {
            addCriterion("h5_url >", value, "h5Url");
            return (Criteria) this;
        }

        public Criteria andH5UrlGreaterThanOrEqualTo(String value) {
            addCriterion("h5_url >=", value, "h5Url");
            return (Criteria) this;
        }

        public Criteria andH5UrlLessThan(String value) {
            addCriterion("h5_url <", value, "h5Url");
            return (Criteria) this;
        }

        public Criteria andH5UrlLessThanOrEqualTo(String value) {
            addCriterion("h5_url <=", value, "h5Url");
            return (Criteria) this;
        }

        public Criteria andH5UrlLike(String value) {
            addCriterion("h5_url like", value, "h5Url");
            return (Criteria) this;
        }

        public Criteria andH5UrlNotLike(String value) {
            addCriterion("h5_url not like", value, "h5Url");
            return (Criteria) this;
        }

        public Criteria andH5UrlIn(List<String> values) {
            addCriterion("h5_url in", values, "h5Url");
            return (Criteria) this;
        }

        public Criteria andH5UrlNotIn(List<String> values) {
            addCriterion("h5_url not in", values, "h5Url");
            return (Criteria) this;
        }

        public Criteria andH5UrlBetween(String value1, String value2) {
            addCriterion("h5_url between", value1, value2, "h5Url");
            return (Criteria) this;
        }

        public Criteria andH5UrlNotBetween(String value1, String value2) {
            addCriterion("h5_url not between", value1, value2, "h5Url");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }
    }

    /**
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}