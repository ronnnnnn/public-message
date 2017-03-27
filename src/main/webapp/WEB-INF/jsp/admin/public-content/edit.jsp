<%@ page language="java" pageEncoding="UTF-8"%>

<script>
	$(function() {
//		var value = $('#she-isUse').val();
//		$('#she-isUse').combobox("setValue",true);
		//alert($('#she-isUse').val());
	});
</script>

<form id="admin_publicMessage_pic_editForm" method="post">
	<table>
		<input name="id" hidden="true" />
		<input name="status" hidden="true" />
		<tr>
			<th>标题</th>
			<td><input  id="epm-title" name="pmTitle" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>内容</th>
			<td><textarea  id="epm-content" name="pmContent" style="width:100%" rows="5" class="textarea easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
	</table>
	
</form>

