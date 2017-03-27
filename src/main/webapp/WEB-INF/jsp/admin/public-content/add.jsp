<%@ page language="java" pageEncoding="UTF-8"%>

<form id="admin_publicMessage_pic_addForm" method="post">
	<table>
		<input name="id" hidden="true" />
		<tr>
			<th>标题</th>
			<td>
			   <input  id="apm-title" name="pmTitle" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>内容</th>
			<td>
			   <textarea  id="apm-content" name="pmContent" style="width:100%" rows="5" class="textarea easyui-validatebox" data-options="required:true"/>
			</td>
		</tr>
	</table>
</form>
