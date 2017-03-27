<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<div>

        <table>
            <tr>
                <input id="cat-id"  type="hidden" <c:if test="${!empty category.id}">value="${category.id}"</c:if>/>
                <input id="cat-parentId"  type="hidden" <c:if test="${!empty category.parentId}">value="${category.parentId}"</c:if>/>
                <input id="cat-parentIds"  type="hidden" <c:if test="${!empty category.parentIds}">value="${category.parentIds}"</c:if>/>
                <input id="cat-priority"  type="hidden" name="priority" class="easyui-validatebox" style="width: 100%" <c:if test="${!empty category.priority}">value="${category.priority}"</c:if>/>
                <th>父节点名称</th>
                <td><input name="parent-name" class="easyui-validatebox" data-options="required:true" style="width: 100%" value=" ${parent.categoryName}" readonly="readonly"/></td>
            </tr>
            <tr>
                <th>类别名称</th>
                <td><input id="cat-categoryName" name="categoryName" class="easyui-validatebox" style="width: 100%" <c:if test="${!empty category.categoryName}">value="${category.categoryName}"</c:if>/></td>
            </tr>
            <tr>
                <th>目录标识</th>
                <td><input id="cat-topic" name="topic" class="easyui-validatebox" style="width: 100%" <c:if test="${!empty category.categoryName}">value="${category.topic}"</c:if>/></td>
            </tr>
            <tr>
                <th>类别编码</th>
                <td><input  id="cat-categoryCode"  class="easyui-validatebox"  name="categoryCode" style="width: 100%" <c:if test="${!empty category.categoryCode}">value="${category.categoryCode}"</c:if>/></td>
            </tr>
            <tr>
                <th>描述</th>
                <td><input id="cat-description" name="permission" class="easyui-validatebox" style="width: 100%" <c:if test="${!empty category.description}">value="${category.description}"</c:if>/></td>
            </tr>

            <tr align="center">

            </tr>
        </table>
</div>
</body>
</html>