<%@ page language="java" pageEncoding="UTF-8"%>

<script type="text/javascript">

	var ue = UE.getEditor('editors');

	function getContent() {
		var arr = [];
		arr.push("使用editor.getContent()方法可以获得编辑器的内容");
		arr.push("内容为：");
		arr.push(UE.getEditor('editor').getContent());
		alert(arr.join("\n"));
	}
</script>

<form id="admin_article_editForm" method="post">
	<table>
		<input name="id" hidden="true" />
		<tr>
			<th>题目</th>
			<td><input id="title" name="title" style="width:100%" class="easyui-validatebox" data-options="required:true" onclick="prizeRandom()" />
			</td>
		</tr>
		<tr>
			<th>类别</th>
			<td>
				<select  id="type"  class="esayui-combobox"  name="type"   style="width: 100%" data-options="required:true">
					<option  value='news'>新闻</option>
					<option  value='article'>文章</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>内容</th>
			<td>
				<script id="editors" name="content" type="text/plain" style="width:1024px;height:500px;">
			    </script>
			</td>
		</tr>
	</table>
	
</form>
