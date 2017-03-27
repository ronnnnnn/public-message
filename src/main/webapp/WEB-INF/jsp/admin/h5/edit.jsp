<%@ page language="java" pageEncoding="UTF-8"%>

<script>
	$(function() {
//		var value = $('#she-isUse').val();
//		$('#she-isUse').combobox("setValue",true);
		//alert($('#she-isUse').val());
	});
</script>

<form id="admin_h5_pic_editForm" method="post">
	<table>
		<input name="id" hidden="true" />
		<tr>
			<th>标题</th>
			<td><input  id="eh5-name" name="h5Name" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>URL</th>
			<td><textarea  id="eh5-url" name="h5Url" style="width:100%" rows="5" class="textarea easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
	</table>
	
</form>

