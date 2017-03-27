<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		showInit();
	});


	function showInit(){
		$('#admin_show_pic_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/show/list',
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
				field : 'mname',
				title : '名字',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'mtype',
				title : '类别',
				width : fixWidth(0.1),
				align : 'center',
			}, {
				field : 'relateUrl',
				title : '关联文章链接',
				width : fixWidth(0.1),
				align : 'center',
			}, {
				field : 'relateArticleTitle',
				title : '关联文章题目',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'sort',
				title : '排序',
				width : fixWidth(0.10),
				align : 'center',
			},{
				field : 'imageUrl',
				title : '图片',
				width : fixWidth(0.2),
				align : 'center',
				formatter : function(value, row, index) {
					return '<a onclick=sshowPic("'+row.imageUrl+'")>预览图片</a>'
				},
			},{
				field : 'createTime',
				title : '创建时间',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'isUse',
				title : '状态',
				width : fixWidth(0.1),
				align : 'center',
				formatter : function(value, row, index) {
					if (value == true) {
						return '使用';
					} else {
						return '未使用';
					}
				},
			} ] ],
			toolbar : [{
				text : '添加',
				iconCls : 'icon-add',
				handler : function() {
					showAddFun();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					showRemove();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					showEditFun();
				}
			}]
		});
	}


	function sshowPic(picUrl) {
		$("#smpic").html("");
		var img = "<img src='"+picUrl+"' width='100%' height='auto'/>";
		$("#smpic").append(img);
		$("#smpic").append("<br/><hr/><br/>");
		$('#smpic').dialog('open');
	}



	function showEditFun() {
		var rows = $('#admin_show_pic_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var d = $('<div/>').dialog({
				width : 300,
				height : 339,
				href : '${pageContext.request.contextPath}/show/edit-panel',
				modal : true,
				align : 'center',
				title : '修改图片',
				buttons : [ {
					text : '修改',
					handler : function() {
						$('#admin_show_pic_editForm').form('submit', {
							url : '${pageContext.request.contextPath}/show/update',
							success : function(data) {

								if (data) {
									d.dialog('destroy');
									$('#admin_show_pic_datagrid').datagrid('load');
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

					$('#admin_show_pic_editForm').form('load', rows[0]);

				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项！');
		}
	}

	function showAddFun() {

		var d = $('<div/>').dialog({
			width : 300,
			height : 339,
			href : '${pageContext.request.contextPath}/show/add-panel',
			modal : true,
			align : 'center',
			title : '添加图片',
			buttons : [ {
				text : '添加',
				handler : function() {
					$('#admin_show_pic_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/show',
						success : function(data) {

							if (data) {
								d.dialog('destroy');
								$('#admin_show_pic_datagrid').datagrid('load');
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
				$('#admin_show_pic_datagrid').form('load', '');

			}
		});

	}

	function showRemove() {
		var rows = $('#admin_show_pic_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_show_pic_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_show_pic_datagrid').datagrid('getSelecteds');
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
						url : '${pageContext.request.contextPath}/show/'+ids,
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(d) {
							var v = $('#admin_show_pic_datagrid');
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

	function xsImport() {
		if ($('#uploadfile').val() == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择一个jpg文件',
			});
		} else {
			$('#admin_show_pic_rollingDialog').dialog('open');
			$.ajaxFileUpload({
				url : '${pageContext.request.contextPath}/show/image',//用于文件上传的服务器端请求地址
				secureuri : true,//是否启用安全提交，一般设置为false
				fileElementId : 'uploadfile',//文件上传控件的id
				dataType : 'text',//服务器返回的数据类型
				success : function(data) {
					$('#admin_show_pic_rollingDialog').dialog('close');
					$('#msh-imageUrl').val(data);
					//var obj = jQuery.parseJSON(data);
					//var obj = JSON.parse(data);
			       // alert(obj.obj);
//					if (data.success) {
//						$('#msh-imageUrl').val(data.obj)
//					}
					$.messager.show({
						title : '提示',
						msg : "图片上传成功",
					});
				},
				error : function(data, status, e) {
					$.messager.show({
						title : '提示',
						msg : '服务中断或连接超时导致通信失败！' ,
					});
				}
			});
		}
	}

	function xsImport4update() {
		if ($('#uuploadfile').val() == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择一个jpg文件',
			});
		} else {
			$('#admin_show_pic_rollingDialog').dialog('open');
			$.ajaxFileUpload({
				url : '${pageContext.request.contextPath}/show/image',//用于文件上传的服务器端请求地址
				secureuri : true,//是否启用安全提交，一般设置为false
				fileElementId : 'uuploadfile',//文件上传控件的id
				dataType : 'text',//服务器返回的数据类型
				success : function(data) {
					$('#admin_show_pic_rollingDialog').dialog('close');
					$('#ush-imageUrl').val(data);
					//var obj = jQuery.parseJSON(data);
					//var obj = JSON.parse(data);
					// alert(obj.obj);
//					if (data.success) {
//						$('#msh-imageUrl').val(data.obj)
//					}
					$.messager.show({
						title : '提示',
						msg : "图片上传成功",
					});
				},
				error : function(data, status, e) {
					$.messager.show({
						title : '提示',
						msg : '服务中断或连接超时导致通信失败！' ,
					});
				}
			});
		}
	}


</script>

<div id="admin_show_pic_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false">
		<table id="admin_show_pic_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
	<div id="admin_show_pic_rollingDialog" class="easyui-dialog" data-options="closed:true,modal:true,title:'提示'" style="width: 300px; height: 70px;" align="center">
		<img alt="上传中。。。" src="${pageContext.request.contextPath}/jslib/imgs/rolling.gif"><br> <a>上传中,请等候...</a>
	</div>

</div>

<div id="smpic" class="easyui-dialog"
	 data-options="closed:true,modal:true,title:'显示图片',buttons:[{
					text : '确定',
					handler : function() {
                      	$('#smpic').dialog('close');
					}}]"
	 style="width:375px; height:auto;" title="显示图片">
</div>

</body>
</html>
