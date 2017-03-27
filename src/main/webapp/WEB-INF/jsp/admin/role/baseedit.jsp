<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>

<form id="admin_user_editForm" method="post">
	<table>
		<tr>
			<input id="r-id" name="id" type="hidden"/>
			<th>角色名称</th>
			<td><input id="r-role" name="role" class="easyui-validatebox" data-options="required:true" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>角色描述</th>
			<td><input id="r-description" name="description" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>


	</table>
	
</form>
