<%@ page language="java" pageEncoding="UTF-8"%>

<form id="admin_h5_pic_addForm" method="post">
	<table>
		<input name="id" hidden="true" />
		<tr>
			<th>标题</th>
			<td><input  id="ah5-name" name="h5Name" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>URL</th>
			<td><textarea  id="ah5-url" name="h5Url" style="width:100%" rows="5" class="textarea easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
	</table>
</form>
