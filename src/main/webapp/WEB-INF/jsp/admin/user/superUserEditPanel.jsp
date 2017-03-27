<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function () {



		$.ajax({
			type: 'get',
			contentType: 'application/json',
			url: '${pageContext.request.contextPath}/role/all/list',
			processData: false,
			dataType: 'json',
			async:false,
			success: function(data) {
				//$("#role-select").empty();
				$.each(data, function (index, value) {
					$("#role-select-e").append("<option value='"+value.id+"'>"+value.description+"</option>");
				});
			},
			error: function() {
				alert('Err...');
			}
		});

	});


	$('#role-select-e').combobox({
		onChange: function() {
			var value = $('#role-select-e').combobox('getValues');
			console.log(value);
			console.log(value.join(','));
		}
	});

	$('#locked-e').combobox({

	});

</script>


<form id="admin_user_editForm" method="post">
	<table>
		<tr>
			<input id="id-e" name="id" type="hidden"/>
			<input id="flag" name="flag" type="hidden" value="0"/>
			<th>用户名</th>
			<td><input id="username-e" name="username" class="easyui-validatebox" data-options="required:true" style="width: 100%" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>名字</th>
			<td><input id="realname-e" name="realName" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>身份证</th>
			<td><input id="userIdentity-e" name="userIdentify" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>角色列表</th>
			<td><select  id="role-select-e" data-options="multiple:true,panelHeight:'auto'" class="esayui-combobox"  name="roleIds" style="width: 100%"></select></td>
		</tr>
		<tr>
			<th>电话</th>
			<td><input id="phone-e" name="phone" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>是否锁定</th>
			<td>
				<input type="radio" name="isLocked" value="true" />锁定
				<input type="radio" name="isLocked" value="false" />活动
			</td>
		</tr>

		<tr align="center">

		</tr>

	</table>
	
</form>
