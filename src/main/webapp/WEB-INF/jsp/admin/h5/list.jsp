<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		publicH5Init();
	});


	function publicH5Init(){
		$('#admin_h5_pic_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/h5/date',
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
				field : 'h5Name',
				title : '名字',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'h5Url',
				title : 'URL',
				width : fixWidth(0.1),
				align : 'center',
			}, {
				field : 'createTime',
				title : '创建时间',
				width : fixWidth(0.1),
				align : 'center',
			} ] ],
			toolbar : [{
				text : '添加',
				iconCls : 'icon-add',
				handler : function() {
					h5AddFun();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					h5EditFun();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					h5Remove();
				}
			}]
		});
	}




	function h5EditFun() {
		var rows = $('#admin_h5_pic_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var d = $('<div/>').dialog({
				width : 250,
				height : 200,
				href : '${pageContext.request.contextPath}/h5/edit-panel',
				modal : true,
				align : 'center',
				title : '修改',
				buttons : [ {
					text : '修改',
					handler : function() {
						$('#admin_h5_pic_editForm').form('submit', {
							url : '${pageContext.request.contextPath}/h5/update',
							success : function(data) {

								if (data) {
									d.dialog('destroy');
									$('#admin_h5_pic_datagrid').datagrid('load');
									/*$('#admin_book_datagrid').datagrid('updateRow', {
									 index : $('#admin_book_datagrid').datagrid('getRowIndex', rows[0]),
									 row : obj.obj
									 });*/
								}

								$.messager.show({
									title : '提示',
									msg : obj.msg,
								});
							}
						});
					}
				} ],
				onClose : function() {
					$(this).dialog('destroy');
				},
				onLoad : function() {

					$('#admin_h5_pic_editForm').form('load', rows[0]);

				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项！');
		}
	}

	function h5AddFun() {

		var d = $('<div/>').dialog({
			width : 250,
			height : 200,
			href : '${pageContext.request.contextPath}/h5/add-panel',
			modal : true,
			align : 'center',
			title : '添加',
			buttons : [ {
				text : '添加',
				handler : function() {
					$('#admin_h5_pic_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/h5',
						success : function(data) {

							if (data) {
								d.dialog('destroy');
								$('#admin_h5_pic_datagrid').datagrid('load');
								/*$('#admin_book_datagrid').datagrid('updateRow', {
								 index : $('#admin_book_datagrid').datagrid('getRowIndex', rows[0]),
								 row : obj.obj
								 });*/
							}

							$.messager.show({
								title : '提示',
								msg : obj.msg,
							});
						}
					});
				}
			} ],
			onClose : function() {
				$(this).dailog('destroy');
			},
			onLoad : function() {
				$('#admin_h5_pic_datagrid').form('load', '');

			}
		});

	}

	function h5Remove() {
		var rows = $('#admin_h5_pic_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_h5_pic_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_h5_pic_datagrid').datagrid('getSelecteds');
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
						url : '${pageContext.request.contextPath}/h5/'+ids,
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(d) {
							var v = $('#admin_h5_pic_datagrid');
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


</script>

<div id="admin_h5_pic_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false">
		<table id="admin_h5_pic_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
</div>

</body>
</html>
