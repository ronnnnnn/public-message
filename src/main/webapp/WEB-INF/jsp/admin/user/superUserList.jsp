<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		init();
	});


	function init(){
		$('#admin_user_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/user/superuser/all',
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
				field : 'username',
				title : '用户名',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'realName',
				title : '名字',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'userIdentify',
				title : '身份证',
				width : fixWidth(0.15),
				align : 'center',
			},{
				field : 'roleIds',
				title : '角色列表',
				width : fixWidth(0.2),
				align : 'center',
				formatter : function(value, row, index) {
					var rolename = "";
					if (value != null && value != undefined && value != '') {

						$.ajax({
							type: 'get',
							url: '${pageContext.request.contextPath}/role/' + value,
							dataType: 'json',
							async:false,
							success: function (data) {
								$.each(data, function (index, value) {
									rolename += value.description + ",";
								});
							},
							error: function (data) {

							}
						});
					}else{
						return rolename;
					}
					return rolename;
				},
			},{
				field : 'phone',
				title : '电话',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'isLocked',
				title : '状态',
				width : fixWidth(0.1),
				align : 'center',
				formatter : function(value, row, index) {
					if (value == true) {
						return '锁定';
					} else {
						return '活动';
					}
				},
			} ] ],
			toolbar : [{
				text : '添加',
				iconCls : 'icon-remove',
				handler : function() {
					userAddFun();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					userRemove();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					userEditFun();
				}
			},'-', {
				text : '修改密码',
				iconCls : 'icon-edit',
				handler : function() {
					passwordEdit();
				}
			}]
		});
	}



	function passwordEdit() {
		var rows = $('#admin_user_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var dp = $('<div/>').dialog({
				width : 270,
				height : 135,
				href : '${pageContext.request.contextPath}/user/password/panel',
				modal : true,
				align : 'center',
				title : '修改密码',
				buttons : [ {
					text : '修改',
					handler : function() {
						var id = $('#id-p').val();
						var newPWD = $('#password-n').val();
						$.ajax({
							type: 'patch',
							contentType: 'application/json',
							url: '${pageContext.request.contextPath}/user/password',
							processData: false,
							dataType: 'json',
							data : '{"id":\"'+id+'\","password":\"'+newPWD+'\"}',
							success: function(data) {
								if(data){
									$('#admin_user_datagrid').datagrid('load');
									dp.dialog('close');
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
					$('#admin_password_editForm').form('load', rows[0]);
				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项！');
		}
	}

	function userEditFun() {
		var rows = $('#admin_user_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var d = $('<div/>').dialog({
				width : 270,
				height : 255,
				href : '${pageContext.request.contextPath}/user/superuser/editpanel',
				modal : true,
				align : 'center',
				title : '修改用户',
				buttons : [ {
					text : '修改',
					handler : function() {
						var username = $('#username-e').val();
						var roleIds = $('#role-select-e').combobox('getValues');

						var locked = $('input[type="radio"][name="isLocked"]:checked').val();
						var phone = $('#phone-e').val();
						var realName = $('#realname-e').val();
						var userIdentify = $('#userIdentity-e').val();
						var id = $('#id-e').val();
						$.ajax({
							type: 'PATCH',
							contentType: 'application/json',
							url: '${pageContext.request.contextPath}/user',
							processData: false,
							dataType: 'json',
							data : '{"username":\"'+username+'\","roleIds":\"'+roleIds+'\","isLocked":\"'+locked+'\","phone":\"'+phone+'\","realName":\"'+realName+'\","userIdentify":\"'+userIdentify+'\","id":\"'+id+'\"}',
							success: function(data) {
								if(data){
									$('#admin_user_datagrid').datagrid('load');
									$('#admin_user_datagrid').datagrid('unselectAll');
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

	function userAddFun() {

		$.ajax({
			type: 'get',
			contentType: 'application/json',
			url: '${pageContext.request.contextPath}/role/all/list',
			processData: false,
			dataType: 'json',
			async:false,
			success: function(data) {
				$("#role-select-a").empty();
				$.each(data, function (index, value) {
					$("#role-select-a").append("<option value='"+value.id+"'>"+value.description+"</option>");
				});
			},
			error: function() {
				alert('Err...');
			}
		});



		$('#admin_user_addForm input').val('');
		$('#admin_user_addForm select').val('');
		$('#admin_user_addDialog').dialog('open');


		$('#role-select-a').combobox({
			onChange: function() {
				var value = $('#role-select-a').combobox('getValues');
				console.log(value);
				console.log(value.join(','));

			}
		});

	}

	function userRemove() {
		var rows = $('#admin_user_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_user_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_user_datagrid').datagrid('getSelecteds');
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
						url : '${pageContext.request.contextPath}/user/'+ids,
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(d) {
							var v = $('#admin_user_datagrid');
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

	function proClearFun() {
		$('#admin_user_datagrid input[name=name]').val('');
		$('#admin_user_datagrid').datagrid('load', {});
	}

	function registerUser() {
		var username = $('#username-a').val();
		var password = $('#password-a').val();
		var userIdentify = $('#userIdentity-a').val();
		var realName = $('#realname-a').val();
		var roleIds = $('#role-select-a').combobox('getValues');
		var phone = $('#phone-a').val();
		var isLocked = $('#locked-a').val();
		var isAdmin = true;
		$.ajax({
			type: 'POST',
			contentType: 'application/json',
			url: '${pageContext.request.contextPath}/user',
			processData: false,
			dataType: 'json',
			data : '{"username":\"'+username+'\","password":\"'+password+'\","roleIds":\"'+roleIds+'\","isLocked":\"'+isLocked+'\","phone":\"'+phone+'\","realName":\"'+realName+'\","userIdentify":\"'+userIdentify+'\","isAdmin":\"'+isAdmin+'\"}',
			success: function(data) {
				if(data){
					$('#admin_user_datagrid').datagrid('load');
					$('#admin_user_addDialog').dialog('close');
				}else{
					alert("用户已经存在");
				}
			},
			error: function() {
				alert('注册失败');
			}
		});
	}

	function UserSearchFun() {
        var utype = true;
		$('#admin_user_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/user/key/'+utype,
			fit : true,
			pagination : true,
			idField : 'id',
			checkOnSelect : false,
			selectOnCheck : false,
			fitColumns : true,
			nowrap : false,
			rownumbers : true,
			queryParams: {
				key : $("input[name$='skey']").val()
			},
			columns : [ [ {
				field : 'id',
				title : '编号',
				width : fixWidth(0.1),
				align : 'center',
				//hidden : true,
				checkbox : true
			}, {
				field : 'username',
				title : '用户名',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'realName',
				title : '名字',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'userIdentify',
				title : '生份证',
				width : fixWidth(0.15),
				align : 'center',
			},{
				field : 'roleIds',
				title : '角色列表',
				width : fixWidth(0.2),
				align : 'center',
				formatter : function(value, row, index) {
					var rolename = "";
					if (value != null && value != undefined && value != '') {

						$.ajax({
							type: 'get',
							url: '${pageContext.request.contextPath}/role/' + value,
							dataType: 'json',
							async:false,
							success: function (data) {
								$.each(data, function (index, value) {
									rolename += value.description + ",";
								});
							},
							error: function (data) {
								alert("err");
							}
						});
					}else{
						return rolename;
					}
					return rolename;
				},
			},{
				field : 'phone',
				title : '电话',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'isLocked',
				title : '状态',
				width : fixWidth(0.1),
				align : 'center',
				formatter : function(value, row, index) {
					if (value == true) {
						return '锁定';
					} else {
						return '活动';
					}
				},
			} ] ],
			toolbar : [{
				text : '添加',
				iconCls : 'icon-remove',
				handler : function() {
					userAddFun();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					userRemove();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					userEditFun();
				}
			},'-', {
				text : '修改密码',
				iconCls : 'icon-edit',
				handler : function() {
					passwordEdit();
				}
			}]
		});


		//$('#admin_zjgl_zjgl_datagrid').datagrid('load', serializeObject($('#admin_zjgl_zjgl_searchForm')));
	}

	function UserSearchFun2() {
		$('#admin_book_layout input[name=skey]').val('');
		init();
	}
</script>

<div id="admin_book_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 70px;">
		<form id="admin_product_searchForm">
			检索用户(可模糊查询):<input name="skey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="UserSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="UserSearchFun2()">清空</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_user_datagrid" data-options="border:false" style="width: auto"></table>
	</div>

</div>

<div id="admin_user_addDialog" class="easyui-dialog"
	 data-options="closed:true,modal:true,title:'添加用户',buttons:[{
					text : '添加',
					iconCls : 'icon-add',
					handler : function() {
                        registerUser();
					}}]"
	 style="width: 280px; height: 315px;" title="添加用户">
	<form id="admin_user_addForm" method="post">
		<table>
			<tr>
				<input id="id-a" name="id" type="hidden"/>
				<th>用户名</th>
				<td><input id="username-a" name="username" class="easyui-validatebox" data-options="required:true" style="width: 100%"/></td>
			</tr>
			<tr>
				<th>密码</th>
				<td><input type="password" id="password-a" name="password" class="easyui-validatebox" data-options="required:true" style="width: 100%"/></td>
			</tr>
			<tr>
				<th>名字</th>
				<td><input id="realname-a" name="realName" class="easyui-validatebox" style="width: 100%"/></td>
			</tr>
			<tr>
				<th>身份证</th>
				<td><input id="userIdentity-a" name="userIdentify" class="easyui-validatebox" style="width: 100%"/></td>
			</tr>
			<tr>
				<th>角色列表</th>
				<td><select  id="role-select-a" data-options="multiple:true,panelHeight:'auto'" class="esayui-combobox"  name="roleIds" style="width: 100%"></select></td>
			</tr>
			<tr>
				<th>电话</th>
				<td><input id="phone-a" name="phone" class="easyui-validatebox" style="width: 100%"/></td>
			</tr>
			<tr>
				<th>是否锁定</th>
				<td>
					<select  id="locked-a" data-options="multiple:false,panelHeight:'auto'" class="esayui-combobox"  name="isLocked" style="width: 100%">
						<option id="true" value='true'>锁定</option>
						<option id="false" value='false'>活动</option>
					</select>
				</td>
			</tr>

			<tr align="center">

			</tr>

		</table>
	</form>
</div>

<div id="mydialog-e"></div>
<div id="mydialog-p"></div>
</body>
</html>
