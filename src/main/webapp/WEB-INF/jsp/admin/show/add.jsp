<%@ page language="java" pageEncoding="UTF-8"%>

<form id="admin_show_pic_addForm" method="post">
	<table>
		<input name="id" hidden="true" />
		<input name="status" hidden="true" />
		<tr>
			<th>名字</th>
			<td><input  id="sh-mname" name="mname" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>类别</th>
			<td>
				<select  id="sh-mtype"  class="esayui-combobox"  name="mtype"   style="width: 100%" data-options="required:true">
					<option  value='轮播图'>轮播图</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>关联文章链接</th>
			<td><input id="sh-relateUrl" name="relateUrl" style="width:100%" class="easyui-validatebox" data-options="required:false" />
			</td>
		</tr>
		<tr>
			<th>关联文章题目</th>
			<td><input id="sh-relateArticleTitle" name="relateArticleTitle" style="width:100%" class="easyui-validatebox" data-options="required:false" />
			</td>
		</tr>
		<tr>
			<th>排序</th>
			<td><input id="sh-sort" name="sort" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>

		<tr>
			<th>是否使用</th>
			<td>
				<select  id="sh-isUse"  class="esayui-combobox"  name="isUse"   style="width: 100%" data-options="required:true">
					<option id="true" value='true'>使用</option>
					<option id="false" value='false' selected = "selected" >禁用</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>图片</th>
			<td>
			    <input  id="msh-imageUrl" name="imageUrl" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
	</table>
	
</form>

<table>
	    <tr>
	        <td width="80px"></td>	
			<td style="word-break:break-all;padding-left: 10px;">
			  <form id="admin_show_pic_importDialog">
			    <input type="file" id="uploadfile" name="file" /><a id="btn" href="#" class="easyui-linkbutton" onclick="xsImport()" data-options="iconCls:'icon-add'">导入</a>
			  </form>
			</td>	
		</tr>

</table>