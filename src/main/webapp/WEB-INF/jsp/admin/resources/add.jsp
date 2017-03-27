<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<div>

        <table>
            <tr>
                <input id="rs-id"  type="hidden" />
                <input id="rs-isAvailable"  type="hidden" />
                <input id="rs-parentId"  type="hidden" value="${resource.parentId}"/>
                <input id="rs-parentIds"  type="hidden" value="${resource.parentIds}"/>
                <th>父节点名称</th>
                <td><input name="parent-name" class="easyui-validatebox" data-options="required:true" style="width: 100%" value=" ${parent.mname}" readonly="readonly"/></td>
            </tr>
            <tr>
                <th>名称</th>
                <td><input id="rs-name" name="name" class="easyui-validatebox" style="width: 100%"/></td>
            </tr>
            <tr>
                <th>类别</th>
                <td>
                    <select  id="rs-type"  class="esayui-combobox"  name="type"   style="width: 100%" data-options="required:true">
                        <option  value='menu'>menu</option>
                        <option  value='button'  >button</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>URL路径</th>
                <td><input  id="rs-url"  class="easyui-validatebox"  name="url" style="width: 100%"/></td>
            </tr>
            <tr>
                <th>权限字符串</th>
                <td><input id="rs-permission" name="permission" class="easyui-validatebox" style="width: 100%"/></td>
            </tr>
            <tr>
                <th>优先级</th>
                <td><input id="rs-priority" name="priority" class="easyui-validatebox" style="width: 100%" data-options="required:true"/></td>
            </tr>

            <tr align="center">

            </tr>
        </table>
</div>
</body>
</html>