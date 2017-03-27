<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		contributeinit();
	});


	function contributeinit(){
		$('#user_contribute_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/user/normaluser/all',
			fit : true,
			pagination : true,
			idField : 'id',
			checkOnSelect : false,
			selectOnCheck : false,
			fitColumns : true,
			nowrap : false,
			rownumbers : true,
			queryParams: {
				order : "contribute_score",
				sort : "desc"
			},
			frozenColumns : [ [ {
				field : 'id',
				title : '编号',
				width : fixWidth(0.1),
				align : 'center',
				//hidden : true,
				checkbox : true
			}, {
				field : 'username',
				title : '用户名',
				width : fixWidth(0.2),
				align : 'center',
			},{
				field : 'realName',
				title : '名字',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'contributeScore',
				title : '贡献值',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'phone',
				title : '电话',
				width : fixWidth(0.2),
				align : 'center',
			} ] ],
			toolbar : [ {
				text : '修改贡献值',
				iconCls : 'icon-edit',
				handler : function() {
					contributeScoreEdit();
				}
			}]
		});
	}



	function contributeScoreEdit() {
		var rows = $('#user_contribute_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var dp = $('<div/>').dialog({
				width : 270,
				height : 135,
				href : '${pageContext.request.contextPath}/user/contribute/panel',
				modal : true,
				align : 'center',
				title : '修改贡献值',
				buttons : [ {
					text : '修改',
					handler : function() {
						var id = $('#id-c').val();
						var newcontributeScore = $('#contribute-c').val();
						$.ajax({
							type: 'patch',
							contentType: 'application/json',
							url: '${pageContext.request.contextPath}/user/contribute',
							processData: false,
							dataType: 'json',
							data : '{"id":\"'+id+'\","contributeScore":\"'+newcontributeScore+'\"}',
							success: function(data) {
								if(data){
									$('#user_contribute_datagrid').datagrid('load');
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
					$('#admin_contribute_editForm').form('load', rows[0]);
				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项！');
		}
	}



	function userContributeSearchFun() {

		$('#user_contribute_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/user/key',
			fit : true,
			pagination : true,
			idField : 'id',
			checkOnSelect : false,
			selectOnCheck : false,
			fitColumns : true,
			nowrap : false,
			rownumbers : true,
			queryParams: {
				key : $("input[name$='rhkey']").val()
			},
			frozenColumns : [ [ {
				field : 'id',
				title : '编号',
				width : fixWidth(0.1),
				align : 'center',
				//hidden : true,
				checkbox : true
			}, {
				field : 'username',
				title : '用户名',
				width : fixWidth(0.2),
				align : 'center',
			},{
				field : 'realName',
				title : '名字',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'contributeScore',
				title : '贡献值',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'phone',
				title : '电话',
				width : fixWidth(0.2),
				align : 'center',
			} ] ],
			toolbar : [ {
				text : '修改贡献值',
				iconCls : 'icon-edit',
				handler : function() {
					contributeScoreEdit();
				}
			}]
		});


		//$('#admin_zjgl_zjgl_datagrid').datagrid('load', serializeObject($('#admin_zjgl_zjgl_searchForm')));
	}

	function userContributeSearchFun1() {
		$('#admin_book_layout input[name=rhkey]').val('');
		$('#user_contribute_datagrid').datagrid('load', {});
	}
</script>

<div id="admin_book_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 70px;">
		<form id="admin_product_searchForm">
			检索用户(可模糊查询):<input name="rhkey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="userContributeSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="userContributeSearchFun1()">清空</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="user_contribute_datagrid" data-options="border:false" style="width: auto"></table>
	</div>

</div>


</body>
</html>
