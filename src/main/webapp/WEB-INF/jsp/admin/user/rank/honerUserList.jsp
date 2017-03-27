<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		honerinit();
	});


	function honerinit(){
		$('#user_honer_datagrid').datagrid({
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
				order : "honer_score",
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
				field : 'honerScore',
				title : '荣誉值',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'phone',
				title : '电话',
				width : fixWidth(0.2),
				align : 'center',
			} ] ],
			toolbar : [ {
				text : '修改荣誉值',
				iconCls : 'icon-edit',
				handler : function() {
					honerScoreEdit();
				}
			}]
		});
	}



	function honerScoreEdit() {
		var rows = $('#user_honer_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var dp = $('<div/>').dialog({
				width : 270,
				height : 135,
				href : '${pageContext.request.contextPath}/user/honer/panel',
				modal : true,
				align : 'center',
				title : '修改荣誉值',
				buttons : [ {
					text : '修改',
					handler : function() {
						var id = $('#id-h').val();
						var newHoner = $('#honer-h').val();
						$.ajax({
							type: 'patch',
							contentType: 'application/json',
							url: '${pageContext.request.contextPath}/user/honer',
							processData: false,
							dataType: 'json',
							data : '{"id":\"'+id+'\","honerScore":\"'+newHoner+'\"}',
							success: function(data) {
								if(data){
									$('#user_honer_datagrid').datagrid('load');
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
					$('#admin_honer_editForm').form('load', rows[0]);
				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项！');
		}
	}




	function userHonerClearFun() {
		$('#user_honer_datagrid input[name=name]').val('');
		$('#user_honer_datagrid').datagrid('load', {});
	}


	function userHonerSearchFun() {

		$('#user_honer_datagrid').datagrid({
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
				key : $("input[name$='rckey']").val()
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
				field : 'honerScore',
				title : '荣誉值',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'phone',
				title : '电话',
				width : fixWidth(0.2),
				align : 'center',
			} ] ],
			toolbar : [ {
				text : '修改荣誉值',
				iconCls : 'icon-edit',
				handler : function() {
					honerScoreEdit();
				}
			}]
		});


		//$('#admin_zjgl_zjgl_datagrid').datagrid('load', serializeObject($('#admin_zjgl_zjgl_searchForm')));
	}

	function userHonerClearFun() {
		$('#user_honer_layout input[name=rckey]').val('');
		$('#user_honer_datagrid').datagrid('load', {});
	}
</script>

<div id="user_honer_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 70px;">
		<form id="user_honer_searchForm">
			检索用户(可模糊查询):<input name="rckey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="userHonerSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="userHonerClearFun()">清空</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="user_honer_datagrid" data-options="border:false" style="width: auto"></table>
	</div>

</div>


</body>
</html>
