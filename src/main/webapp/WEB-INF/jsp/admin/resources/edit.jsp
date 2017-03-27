<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<div>

        <table>
            <tr>
                <input id="rse-id"  type="hidden" <c:if test="${!empty resource.id}">value="${resource.id}"</c:if>/>
                <input id="rse-isAvailable"  type="hidden" <c:if test="${!empty resource.isAvailable}">value="${resource.isAvailable}"</c:if> />
                <input id="rse-parentId"  type="hidden" <c:if test="${!empty resource.parentId}">value="${resource.parentId}"</c:if>/>
                <input id="rse-parentIds"  type="hidden" <c:if test="${!empty resource.parentIds}">value="${resource.parentIds}"</c:if>/>
                <th>父节点名称</th>
                <td><input name="parent-name" class="easyui-validatebox" data-options="required:true" style="width: 100%" value=" ${parent.mname}" readonly="readonly"/></td>
            </tr>
            <tr>
                <th>名称</th>
                <td><input id="rse-name" name="name" class="easyui-validatebox" style="width: 100%" <c:if test="${!empty resource.mname}">value="${resource.mname}"</c:if>/></td>
            </tr>
            <tr>
                <th>类别</th>
                <td>
                    <select  id="rse-type"  class="esayui-combobox"  name="type"   style="width: 100%" data-options="required:true"  <c:if test="${!empty resource.mtype}">value='${resource.mtype}'</c:if>>
                        <option  value='menu' <c:if test="${'menu' eq resource.mtype}">selected</c:if>>menu</option>
                        <option  value='button' <c:if test="${'button' eq resource.mtype}">selected</c:if>>button</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>URL路径</th>
                <td><input  id="rse-url"  class="easyui-validatebox"  name="url" style="width: 100%" <c:if test="${!empty resource.url}">value="${resource.url}"</c:if>/></td>
            </tr>
            <tr>
                <th>权限字符串</th>
                <td><input id="rse-permission" name="permission" class="easyui-validatebox" style="width: 100%" <c:if test="${!empty resource.permission}">value="${resource.permission}"</c:if>/></td>
            </tr>
            <tr>
                <th>优先级</th>
                <td><input id="rse-priority" name="priority" class="easyui-validatebox" style="width: 100%" <c:if test="${!empty resource.priority}">value="${resource.priority}"</c:if>/></td>
            </tr>
        </table>
</div>
</body>
</html>