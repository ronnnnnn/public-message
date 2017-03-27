<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>

<script type="text/javascript">
	$(function() {
		roleinit();
	});


	function roleinit(){
		$('#admin_role_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/role/list',
			fit : true,
			pagination : true,
			idField : 'id',
			checkOnSelect : false,
			selectOnCheck : false,
			fitColumns : true,
			nowrap : false,
			rownumbers : true,
			columns : [ [ {
				field : 'id',
				title : '编号',
				width : fixWidth(0.1),
				align : 'center',
				//hidden : true,
				checkbox : true
			}, {
				field : 'role',
				title : '角色名称',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'description',
				title : '角色描述',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'resourceIds',
				title : '拥有资源',
				width : fixWidth(0.4),
				align : 'center',
				formatter : function(value, row, index) {
					try{
						var resourcename = "";
						if (value != null && value != undefined && value != '') {

							$.ajax({
								type: 'get',
								url: '${pageContext.request.contextPath}/resources/' + value,
								dataType: 'json',
								async:false,
								success: function (data) {

									$.each(data, function (index, mvalue) {
										resourcename += mvalue.mname + " ";
									});

								},
								error: function (data) {
									alert("err");
								}
							});
						}else{
							return resourcename;
						}
						return resourcename;
					}catch(err) {
						return resourcename;
					}
				},
			}] ],
			toolbar : [{
				text : '添加',
				iconCls : 'icon-remove',
				handler : function() {
					roleAddFun();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					roleRemove();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					roleEditFun();
				}
			},'-', {
				text : '资源管理',
				iconCls : 'icon-edit',
				handler : function() {
					myresource();
				}
			}]
		});
	}



	function myresource(){
		var rows = $('#admin_role_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var d = $('<div/>').dialog({
				width : 300,
				height : 400,
				href : '${pageContext.request.contextPath}/role/edit/' + rows[0].id ,
				modal : true,
				align : 'center',
				title : '资源管理',
				buttons : [ {
					text : '修改',
					handler : function() {
						var id = rows[0].id;
						var resourceId = $('#resourceId').val();

						$.ajax({
							type: 'PATCH',
							contentType: 'application/json',
							url: '${pageContext.request.contextPath}/role',
							processData: false,
							dataType: 'json',
							data : '{"id":\"'+id+'\","resourceIds":\"'+resourceId+'\"}',
							success: function(data) {
								if(data){
									$('#admin_role_datagrid').datagrid('load');
									$('#admin_role_datagrid').datagrid('unselectAll');
									d.dialog('destroy');
								}else{
									alert("修改失败!");
								}
							},
							error: function() {
								alert('修改错误!');
							}
						});
					}
				} ],
				onClose : function() {
					$(this).dialog('destroy');
				},
				onLoad : function() {

//					$('#admin_user_editForm').form('load', rows[0]);

				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项！');
		}

	}


	function roleEditFun() {
		var rows = $('#admin_role_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var d = $('<div/>').dialog({
				width : 250,
				height : 150,
				href : '${pageContext.request.contextPath}/role/baseedit',
				modal : true,
				align : 'center',
				title : '修改角色',
				buttons : [ {
					text : '修改',
					handler : function() {
						var id = $('#r-id').val();
						var role = $('#r-role').val();
						var description = $('#r-description').val();
						$.ajax({
							type: 'PATCH',
							contentType: 'application/json',
							url: '${pageContext.request.contextPath}/role',
							processData: false,
							dataType: 'json',
							data : '{"id":\"'+id+'\","role":\"'+role+'\","description":\"'+description+'\"}',
							success: function(data) {
								if(data){
									$('#admin_role_datagrid').datagrid('load');
									$('#admin_role_datagrid').datagrid('unselectAll');
									d.dialog('destroy');
								}else{
									alert("修改失败!");
								}
							},
							error: function() {
								alert('修改错误!');
							}
						});
					}
				} ],
				onClose : function() {
					$(this).dialog('destroy');
				},
				onLoad : function() {

					$('#admin_user_editForm').form('load', rows[0]);

				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项！');
		}
	}

	function roleAddFun() {

		$.ajax({
			type: 'get',
			contentType: 'application/json',
			url: '${pageContext.request.contextPath}/resources/all/list',
			processData: false,
			dataType: 'json',
			async:false,
			success: function(data) {
				$("#role-select-a").empty();
				$.each(data, function (index, value) {
					$("#resource-select-a").append("<option value='"+value.id+"'>"+value.mname+"</option>");
				});
			},
			error: function() {
				alert('Err...');
			}
		});



		$('#admin_role_addForm input').val('');
		$('#admin_role_addForm select').val('');
		$('#admin_role_addDialog').dialog('open');


		$('#resource-select-a').combobox({
			onChange: function() {
				var value = $('#resource-select-a').combobox('getValues');
				console.log(value);
				console.log(value.join(','));

			}
		});

	}

	function roleRemove() {
		var rows = $('#admin_role_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_role_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_role_datagrid').datagrid('getSelecteds');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('确认', '您是否要删除当前选中的选项？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
						ids.join(',')
					}
					$.ajax({
						type: 'delete',
						url : '${pageContext.request.contextPath}/role/'+ids,
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(d) {
							var v = $('#admin_role_datagrid');
							v.datagrid('reload');
							v.datagrid('unselectAll');
							v.datagrid('clearChecked');
							$.messager.show({
								title : '提示',
								msg : '删除成功'
							});
						}
					});

				}
			});

		} else {
			$.messager.show({
				title : '提示',
				msg : '请勾选要删除的选项！'
			});
		}

	}



	function addrole() {
		var role = $('#r-role-a').val();
		var description = $('#r-description-a').val();
//		var resourceIds = $('#resource-select-a').combobox('getValues');

		$.ajax({
			type: 'POST',
			contentType: 'application/json',
			url: '${pageContext.request.contextPath}/role',
			processData: false,
			dataType: 'json',
			data : '{"role":\"'+role+'\","description":\"'+description+'\"}',
			success: function(data) {
				if(data){
					$('#admin_role_datagrid').datagrid('load');
					$('#admin_role_addDialog').dialog('close');
				}else{
					alert("用户已经存在");
				}
			},
			error: function() {
				alert('注册失败');
			}
		});
	}


	function roleSearchFun2() {
		$('#admin_role_layout input[name=key]').val('');
		roleinit();
	}
</script>

<div id="admin_role_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false">
		<table id="admin_role_datagrid" data-options="border:false" style="width: auto"></table>
	</div>

</div>

<div id="admin_role_addDialog" class="easyui-dialog"
	 data-options="closed:true,modal:true,title:'添加角色',buttons:[{
					text : '添加',
					iconCls : 'icon-add',
					handler : function() {
                        addrole();
					}}]"
	 style="width: 270px; height: 150px;" title="添加用户">
	<form id="admin_role_addForm" method="post">
		<table>
			<tr>
				<input id="id-a" name="id" type="hidden"/>
				<th>角色名称</th>
				<td><input id="r-role-a" name="role" class="easyui-validatebox" data-options="required:true" style="width: 100%"/></td>
			</tr>
			<tr>
				<th>角色描述</th>
				<td><input  id="r-description-a" name="description" class="easyui-validatebox" data-options="required:true" style="width: 100%"/></td>
			</tr>

		</table>
	</form>
</div>



<div id="mydialog-e"></div>
<div id="mydialog-p"></div>
</body>
</html>
