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


</script>


<form id="admin_normal_user_editForm" method="post">
	<table>
		<tr>
			<input id="id-ne" name="id" type="hidden"/>
			<input id="flag" name="flag" type="hidden" value="0"/>
			<th>用户名</th>
			<td><input id="username-ne" name="username" class="easyui-validatebox" data-options="required:true" style="width: 100%" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>昵称</th>
			<td><input id="nickname-ne" name="nickname" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>名字</th>
			<td><input id="realname-ne" name="realName" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>身份证</th>
			<td><input id="userIdentity-ne" name="userIdentify" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>电话</th>
			<td><input id="phone-ne" name="phone" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>邮箱</th>
			<td><input id="email-ne" name="email" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>头像</th>
			<td><input id="photo-ne" name="photo" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<td width="80px"></td>
			<td style="word-break:break-all;padding-left: 10px;">
				<form id="admin_user_pic_importDialog">
					<input type="file" id="useruploadfilee" name="file" /><a id="btn" href="#" class="easyui-linkbutton" onclick="userxsImport()" data-options="iconCls:'icon-add'">导入</a>
				</form>
			</td>
		</tr>
		<tr>
			<th>当前常用地</th>
			<td><input id="currentArea-ne" name="currentArea" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>贡献值</th>
			<td><input id="contributeScore-ne" name="contributeScore" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>荣誉值</th>
			<td><input id="honerScore-ne" name="honerScore" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>评星总分</th>
			<td><input id="gradeTotal-ne" name="gradeTotal" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>评星次数</th>
			<td><input id="gradeTimes-ne" name="gradeTimes" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>提示现账户</th>
			<td><input id="withdrawAccount-ne" name="withdrawAccount" class="easyui-validatebox" style="width: 100%"/></td>
		</tr>
		<tr>
			<th>是否锁定</th>

			<td>
				<input type="radio" name="isLocked" value="true" />锁定
				<input type="radio" name="isLocked" value="false" />活动
			</td>
				<%--<select  id="locked-ne"  class="esayui-combobox"  name="isLocked"   style="width: 100%" data-options="required:true">--%>
					<%--<option id="true" value='true'>锁定</option>--%>
					<%--<option id="false" value='false' selected = "selected" >活动</option>--%>
			    <%--</select>--%>
			<%--</td>--%>
		</tr>

		<tr align="center">

		</tr>

	</table>
	
</form>
