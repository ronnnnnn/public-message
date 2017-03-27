<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">

	var vsetting = {
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			beforeClick: vbeforeClick,
			onClick: vonClick
			//onCheck: onCheck
		}
	};

	var vNodes =[
		<c:forEach items="${vcategoryList}" var="va">
		<c:if test="${not va.rootNode}">
		{ id:${va.id}, pId:${va.parentId}, name:"${va.categoryName}",},
		</c:if>
		</c:forEach>
	];

	function vbeforeClick(treeId, treeNode) {
		var check = (treeNode && !treeNode.isParent);
		if (!check) alert("只能选择子目录");
		return check;
	}

	function vonClick(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("vtree"),
				nodes = zTree.getSelectedNodes(),
				v = "";
		d = "";
		nodes.sort(function compare(a,b){return a.id-b.id;});
		for (var i=0, l=nodes.length; i<l; i++) {
			v = nodes[i].name;
			d = nodes[i].id;
		}
		if (v.length > 0 ) v = v.substring(0, v.length);
		var cityObj = $("#vcategoryName");
		var vcategoryId = $("#vcategoryId");
		cityObj.attr("value", v);
		vcategoryId.attr("value",d);
	}

	function vshowMenu() {
		var cityObj = $("#vcategoryName");
		var cityOffset = $("#vcategoryName").offset();
		$("#vmenuContent").css({left:30 + "px", top:100 + "px"}).slideDown("fast");

		$("body").bind("mousedown", vonBodyDown);
	}

	function vchideMenu() {
		$("#vmenuContent").fadeOut("fast");
		$("body").unbind("mousedown", vonBodyDown);
	}

	function vonBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "vmenuContent" || $(event.target).parents("#vmenuContent").length>0)) {
			vchideMenu();
		}
	}

	$(function () {
		$.fn.zTree.init($("#vtree"), vsetting, vNodes);
		$("#menuBtn").click(vshowMenu);
	});



	function searchArticle() {
		if ($('#vcategoryName').val() == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择一个类别！',
			});
		}else {
			var categotyId = $('#vcategoryId').val();
			var vlistUrl = '${pageContext.request.contextPath}/newArticle/list/'+ categotyId;
			ArticleInfoInit(vlistUrl);
		}
	}


	function ArticleInfoInit(myurl){
		$('#admin_ArticleInfo_datagrid').datagrid({
			url : myurl,
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
				width : fixWidth(0.06),
				align : 'center',
				//hidden : true,
				checkbox : true
			}, {
				field : 'title',
				title : '标题',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'type',
				title : '类别',
				width : fixWidth(0.15),
				align : 'center',
			},{
				field : 'paper',
				title : '摘要',
				width : fixWidth(0.25),
				align : 'center',
			},{
				field : 'createTime',
				title : '创建时间',
				width : fixWidth(0.06),
				align : 'center',
			}] ],
			toolbar : [ {
				text : '添加',
				iconCls : 'icon-add',
				handler : function() {
					ArticleAddFun();
				}
			}, '-', {
				text : '预览文章',
				iconCls : 'icon-edit',
				handler : function() {
					ArticleView();
				}
			}, '-',{
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					ArticleInfoRemove();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					ArticleInfoUpdate();
				}
			}]
		});
	}

	function mshowArticle(row) {
		//var data = row.content;
		$("#smpic").html("");
		//var img = "<img src='"+picUrl+"' width='100%' height='auto'/>";
		$("#smpic").append(row.content);
		$("#smpic").append("<br/><hr/><br/>");
		$('#smpic').dialog('open');
	}

	function ArticleInfoUpdateStatus(type) {
		var rows = $('#admin_ArticleInfo_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_ArticleInfo_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_ArticleInfo_datagrid').datagrid('getSelecteds');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('确认', '您是否要修改当前选中的选项？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
						ids.join(',')
					}

					$.ajax({
						type: 'patch',
						url : '${pageContext.request.contextPath}/ArticleInfo/'+ids+"/"+type,
						dataType : 'json',
						success : function(d) {
							var v = $('#admin_ArticleInfo_datagrid');
							v.datagrid('reload');
							v.datagrid('unselectAll');
							v.datagrid('clearChecked');
							$.messager.show({
								title : '提示',
								msg : '修改成功'
							});
						}
					});

				}
			});

		} else {
			$.messager.show({
				title : '提示',
				msg : '请勾选要修改的选项！'
			});
		}

	}
    var flag = "";

	function ArticleAddFun() {
		flag = true;

		$('#admin_article_addDialog input').val('');
		$('#admin_article_addDialog select').val('');
		$('#paper').val('');
		ue.setContent("");
		$('#admin_article_addDialog').dialog('open');

	}

	function ArticleInfoRemove() {
		var rows = $('#admin_ArticleInfo_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_ArticleInfo_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_ArticleInfo_datagrid').datagrid('getSelecteds');
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
						url : '${pageContext.request.contextPath}/newArticle/'+ids,
						dataType : 'json',
						success : function(d) {
							if(d){
								var v = $('#admin_ArticleInfo_datagrid');
								v.datagrid('reload');
								v.datagrid('unselectAll');
								v.datagrid('clearChecked');
								$.messager.show({
									title : '提示',
									msg : '删除成功'
								});
							}else{
								$.messager.show({
									title : '提示',
									msg : '不允许删除!'
								});
							}

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

	function ArticleInfoUpdate() {
		flag = false;
		var rows = $('#admin_ArticleInfo_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			$('#id').val(rows[0].id);
			$('#type').val(rows[0].type);
			$('#title').val(rows[0].title);
			$('#paper').val(rows[0].paper);
			ue.setContent(rows[0].content);
			$('#admin_article_addDialog').dialog('open');
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项！');
		}

	}

	function ArticleView() {
		var rows = $('#admin_ArticleInfo_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			mshowArticle(rows[0]);
//			alert(rows[0].id);
//			$('#id').val(rows[0].id);
//			$('#type').val(rows[0].type);
//			$('#title').val(rows[0].title);
//			ue.setContent(rows[0].content);
//			$('#admin_article_addDialog').dialog('open');
		} else {
			$.messager.alert('提示', '请勾选一个要预览的选项！');
		}

	}


	function ArticleInfoSearchFun() {
		var mykey = $("input[name$='ArticleInfokey']").val();
		var asearchUrl = '${pageContext.request.contextPath}/ArticleInfo/search/'+mykey;
		ArticleInfoInit(asearchUrl);
	}

	function ArticleInfoClearFun() {
		$('#admin_ArticleInfo_layout input[name=ArticleInfokey]').val('');
		var initurl = '${pageContext.request.contextPath}/ArticleInfo/list';
		ArticleInfoInit(initurl);
	}

	function ArticleCommentManage() {
		var rows = $('#admin_ArticleInfo_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			setCookie('ArticleId',rows[0].id);
			var url = '${pageContext.request.contextPath}/comment/Article/list-panel';
			addTabs({
				title : '公共服务评论管理',
				href : url,
				closable : true
			});

		} else {
			$.messager.alert('提示', '请勾选一个要管理的文章！');
		}

	}

	var ue = UE.getEditor('editor');


	function getContent() {
		var arr = [];
		arr.push("使用editor.getContent()方法可以获得编辑器的内容");
		arr.push("内容为：");
		arr.push(UE.getEditor('editor').getContent());
		alert(arr.join("\n"));
	}


	function addArticle(){
		var catId = $('#vcategoryId').val();
		var myurl = "";
		if(flag){
			myurl = '${pageContext.request.contextPath}/newArticle/'+catId;
		}else {
			myurl = '${pageContext.request.contextPath}/newArticle/update';
		}

		$('#admin_article_addForm').form('submit', {
			url : myurl,
			success : function(data) {

				if (data) {
					$('#admin_article_addDialog').dialog('close');
					var v = $('#admin_ArticleInfo_datagrid');
					v.datagrid('reload');
					v.datagrid('unselectAll');
					v.datagrid('clearChecked');

					/*$('#admin_book_datagrid').datagrid('updateRow', {
					 index : $('#admin_book_datagrid').datagrid('getRowIndex', rows[0]),
					 row : obj.obj
					 });*/
				}

				$.messager.show({
					title : '提示',
					msg : "添加成功",
				});
			}
		});
	}
</script>



<div id="admin_ArticleInfo_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 100px;">
		<form id="user_honer_searchForm">
			检索文章(根据内容):<input name="ArticleInfokey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ArticleInfoSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="ArticleInfoClearFun()">清空</a>
		</form>
		<form id="admin_helpinfo_gethelpForm" method="post">
			<input type="hidden" id="vcategoryId" name="vcategoryId" style="width: 10%">
			类别：<input id="vcategoryName" name="vcategoryName" style="width: 10%"> <a id="tmenuBtn" href="#" onclick="vshowMenu()">选择类别</a><br/>
			<a  href="#" class="easyui-linkbutton" onclick="searchArticle()">管理类别内容</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_ArticleInfo_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
	<div id="admin_ArticleInfo_pic_rollingDialog" class="easyui-dialog" data-options="closed:true,modal:true,title:'提示'" style="width: 300px; height: 70px;" align="center">
		<img alt="上传中。。。" src="${pageContext.request.contextPath}/jslib/imgs/rolling.gif"><br> <a>上传中,请等候...</a>
	</div>
</div>

<div id="vmenuContent" class="menuContent" style="display:none; position: absolute;">
	<ul id="vtree" class="ztree" style="margin-top:0; width:180px;height: 200px"></ul>
</div>


<div id="csdetail" class="easyui-dialog"
	 data-options="closed:true,modal:true,title:'显示用户详情',buttons:[{
					text : '确定',
					handler : function() {
                      	$('#csdetail').dialog('close');
					}}]"
	 style="width: 250px; height: 300px;" title="显示详情">
</div>


<div id="admin_article_addDialog" class="easyui-dialog"
	 data-options="closed:true,modal:false,title:'添加内容',buttons:[{
					text : '完成',
					iconCls : 'icon-add',
					handler : function() {
                        addArticle();
					}}]"
	 style="width: 1125px; height: 700px;" title="添加内容;">
	<form id="admin_article_addForm" method="post">
		<table>

			<tr>
				<input id="id" name="id" hidden="true" />
				<th>题目</th>
				<td><input id="title" name="title" style="width:100%" class="easyui-validatebox" data-options="required:true" />
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
				<th>摘要</th>
				<td>
					<textarea id="paper" name="paper" style="width:100%" class="easyui-validatebox" data-options="required:false" />
				</td>
			</tr>
			<tr>
				<th>内容</th>
				<td>
					<script id="editor" name="content" type="text/plain" style="width:1024px;height:500px;">
					</script>
				</td>
			</tr>
		</table>

	</form>
</div>

<div id="md"></div>

<div id="smpic" class="easyui-dialog"
	 data-options="closed:true,modal:true,title:'显示文章',buttons:[{
					text : '确定',
					handler : function() {
						var v = $('#admin_ArticleInfo_datagrid');
						v.datagrid('reload');
						v.datagrid('unselectAll');
						v.datagrid('clearChecked');
                      	$('#smpic').dialog('close');
					}}]"
	 style="width:1000px; height:600px;" title="显示文章">
</div>
<div id="mydialog-e"></div>

</body>
</html>
