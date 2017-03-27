<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title></title>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tablecss.css">--%>

</head>
<body>

<c:if test="${not empty msg}">
    <div class="message">${msg}</div>
</c:if>

<table id="mtreeTable";>
    <thead>
        <tr>
            <th style="font-size: 14px; padding : 8px;background: #F4F4F4">名称</th>
            <th style="font-size: 14px; padding : 8px;background: #F4F4F4">类型</th>
            <th style="font-size: 14px; padding : 8px;background: #F4F4F4">URL路径</th>
            <th style="font-size: 14px; padding : 8px;background: #F4F4F4">权限字符串</th>
            <th style="font-size: 14px; padding : 8px;background: #F4F4F4">层级编码</th>
            <th style="font-size: 14px; padding : 8px;background: #F4F4F4">操作</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${resourceList}" var="resource">
            <tr  data-tt-id='${resource.id}' <c:if test="${not resource.rootNode}">data-tt-parent-id='${resource.parentId}'</c:if>>
                <td style="font-size: 14px; padding : 8px;">${resource.mname}</td>
                <td style="font-size: 14px; padding : 8px;">${resource.mtype}</td>
                <td style="font-size: 14px; padding : 8px;">${resource.url}</td>
                <td style="font-size: 14px; padding : 8px;">${resource.permission}</td>
                <td style="font-size: 14px; padding : 8px;">${resource.priority}</td>
                <td style="font-size: 14px; padding : 8px;">
                    <shiro:hasPermission name="resource:create">
                        <c:if test="${resource.mtype ne 'button'}">
                            <button onclick="addChild(${resource.id})">添加子节点</button>
                        <%--<a href="${pageContext.request.contextPath}/resource/${resource.id}/appendChild">添加子节点</a>--%>
                        </c:if>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="resource:update">
                            <button onclick="editChild(${resource.id})">修改</button>
                        <%--<a href="${pageContext.request.contextPath}/resource/${resource.id}/update">修改</a>--%>
                    </shiro:hasPermission>
                    <c:if test="${not resource.rootNode}">

                    <shiro:hasPermission name="resource:delete">
                        <button onclick="deleteChild(${resource.id})">删除</button>
                        <%--<a class="deleteBtn" href="#" data-id="${resource.id}">删除</a>--%>
                    </shiro:hasPermission>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<%--<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>--%>

<script>
    $(function() {
        try{
            $("#mtreeTable").treetable({ expandable: true }).treetable("expandNode", 2);
            $(".deleteBtn").click(function() {
                if(confirm("确认删除吗?")) {
                   // location.href = "${pageContext.request.contextPath}/resource/"+$(this).data("id")+"/delete";
                }
            });

        }catch (err){
            var txt = err;
        }
    });
</script>
<script>
    function  addEvent() {

        var lt = $('#lyout_center_tabs');
        lt.tabs('close', "资源管理");
    }


    function addChild(resourceId) {
        var d = $('<div/>').dialog({
            width : 300,
            height : 270,
            href : '${pageContext.request.contextPath}/resources/'+resourceId+'/appendChild',
            modal : true,
            align : 'center',
            title : '添加子节点',
            buttons : [ {
                text : '添加',
                handler : function() {

                    var parentId = $('#rs-parentId').val();
                    var parentIds = $('#rs-parentIds').val();
                    var mname = $('#rs-name').val();
                    var mtype = $('#rs-type').val();
                    var url = $('#rs-url').val();
                    var permission = $('#rs-permission').val();
                    var priority = $('#rs-priority').val();
                    $.ajax({
                        type: 'POST',
                        contentType: 'application/json',
                        url: '${pageContext.request.contextPath}/resources/'+resourceId+'/appendChild',
                        processData: false,
                        dataType: 'json',
                        data : '{"parentId":\"'+parentId+'\","parentIds":\"'+parentIds+'\","mname":\"'+mname+'\","mtype":\"'+mtype+'\","url":\"'+url+'\","permission":\"'+permission+'\","priority":\"'+priority+'\"}',
                        success: function(data) {
                            d.dialog('destroy');
                            var currTab =  $('#lyout_center_tabs').tabs('getSelected'); //获得当前tab
                            currTab.panel('refresh');
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

            }
        });
    }


    function editChild(resourceId) {
        var d = $('<div/>').dialog({
            width : 300,
            height : 270,
            href : '${pageContext.request.contextPath}/resources/'+resourceId+'/update',
            modal : true,
            align : 'center',
            title : '修改子节点',
            buttons : [ {
                text : '修改',
                handler : function() {
                    var id = $('#rse-id').val();
                    var parentId = $('#rse-parentId').val();
                    var parentIds = $('#rse-parentIds').val();
                    var mname = $('#rse-name').val();
                    var mtype = $('#rse-type').val();
                    var url = $('#rse-url').val();
                    var permission = $('#rse-permission').val();
                    var priority = $('#rse-priority').val();
                    $.ajax({
                        type: 'POST',
                        contentType: 'application/json',
                        url: '${pageContext.request.contextPath}/resources/'+resourceId+'/update',
                        processData: false,
                        dataType: 'json',
                        data : '{"id":\"'+id+'\","parentId":\"'+parentId+'\","parentIds":\"'+parentIds+'\","mname":\"'+mname+'\","mtype":\"'+mtype+'\","url":\"'+url+'\","permission":\"'+permission+'\","priority":\"'+priority+'\"}',
                        success: function(data) {
                            d.dialog('destroy');
                            var currTab =  $('#lyout_center_tabs').tabs('getSelected'); //获得当前tab
                            currTab.panel('refresh');
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

            }
        });
    }

    function deleteChild(resourceId) {
        $.ajax({
            type: 'delete',
            contentType: 'application/json',
            url: '${pageContext.request.contextPath}/resources/'+resourceId,
            processData: false,
            dataType: 'json',
                success: function(data) {
                if(data == true){
                    $.messager.alert('提示', '删除成功！');
                }else{
                    $.messager.alert('提示', '不能删除根节点！');
                }
                var currTab =  $('#lyout_center_tabs').tabs('getSelected'); //获得当前tab
                currTab.panel('refresh');
            },
            error: function() {
                alert('错误!');
            }
        });
    }
</script>
</body>
</html>