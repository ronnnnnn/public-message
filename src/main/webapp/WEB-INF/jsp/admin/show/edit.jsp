<%@ page language="java" pageEncoding="UTF-8"%>

<script>
	$(function() {
//		var value = $('#she-isUse').val();
//		$('#she-isUse').combobox("setValue",true);
		//alert($('#she-isUse').val());
	});
</script>

<form id="admin_show_pic_editForm" method="post">
	<table>
		<input name="id" hidden="true" />
		<input name="status" hidden="true" />
		<tr>
			<th>名字</th>
			<td><input  id="she-mname" name="mname" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>类别</th>
			<td>
				<select  id="she-mtype"  class="esayui-combobox"  name="mtype"   style="width: 100%" data-options="required:true">
					<option  value='轮播图'>轮播图</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>关联文章链接</th>
			<td><input id="she-relateUrl" name="relateUrl" style="width:100%" class="easyui-validatebox" data-options="required:false" />
			</td>
		</tr>
		<tr>
			<th>关联文章题目</th>
			<td><input id="she-relateArticleTitle" name="relateArticleTitle" style="width:100%" class="easyui-validatebox" data-options="required:false" />
			</td>
		</tr>
		<tr>
			<th>排序</th>
			<td><input id="she-sort" name="sort" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>

		<tr>
			<th>是否使用</th>
			<td>
				<input type="radio" name="isUse" value="true" />使用
				<input type="radio" name="isUse" value="false" />停用
			</td>
			<%--<td>--%>

				<%--<select  id="she-isUse"  class="esayui-combobox"  name="isUse"   style="width: 100%" data-options="required:true">--%>
					<%--<option  value='true'>使用</option>--%>
					<%--<option  value='false'>未使用</option>--%>
				<%--</select>--%>
			<%--</td>--%>
		</tr>
		<tr>
			<th>图片</th>
			<td>
			    <input  id="ush-imageUrl" name="imageUrl" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
	</table>
	
</form>

<table>
	    <tr>
	        <td width="80px"></td>	
			<td style="word-break:break-all;padding-left: 10px;">
			  <form id="admin_show_pic_importDialog">
			    <input type="file" id="uuploadfile" name="file" /><a id="btn" href="#" class="easyui-linkbutton" onclick="xsImport4update()" data-options="iconCls:'icon-add'">导入</a>
			  </form>
			</td>
		</tr>
</table>