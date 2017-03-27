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

<table id="mytreeTable";>
    <thead>
        <tr>
            <th style="font-size: 14px; padding : 8px;background: #F4F4F4">类别名称</th>
            <th style="font-size: 14px; padding : 8px;background: #F4F4F4">目录标识</th>
            <th style="font-size: 14px; padding : 8px;background: #F4F4F4">类别编码</th>
            <th style="font-size: 14px; padding : 8px;background: #F4F4F4">说明</th>
            <th style="font-size: 14px; padding : 8px;background: #F4F4F4">操作</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${categoryList}" var="category">
            <tr  data-tt-id='${category.id}' <c:if test="${not category.rootNode}">data-tt-parent-id='${category.parentId}'</c:if>>
                <td style="font-size: 14px; padding : 8px;">${category.categoryName}</td>
                <td style="font-size: 14px; padding : 8px;">${category.topic}</td>
                <td style="font-size: 14px; padding : 8px;">${category.categoryCode}</td>
                <td style="font-size: 14px; padding : 8px;">${category.description}</td>
                <td style="font-size: 14px; padding : 8px;">

                    <button onclick="caddChild(${category.id})">添加子节点</button>

                    <button onclick="ceditChild(${category.id})">修改</button>

                    <button onclick="cdeleteChild(${category.id})">删除</button>

                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<%--<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>--%>

<script>
    $(function() {
        try{
            $("#mytreeTable").treetable({ expandable: true }).treetable("expandNode", 2);
            $(".deleteBtn").click(function() {
                if(confirm("确认删除吗?")) {
                    location.href = "${pageContext.request.contextPath}/category/"+$(this).data("id")+"/delete";
                }
            });

        }catch (err){
            var txt = err;
        }
    });

    function  addEvent() {

        var lt = $('#lyout_center_tabs');
        lt.tabs('close', "资源管理");
    }


    function caddChild(categoryId) {
        var d = $('<div/>').dialog({
            width : 300,
            height : 270,
            href : '${pageContext.request.contextPath}/category/'+categoryId+'/appendChild',
            modal : true,
            align : 'center',
            title : '添加子节点',
            buttons : [ {
                text : '添加',
                handler : function() {

                    var parentId = $('#cat-parentId').val();
                    var parentIds = $('#cat-parentIds').val();
                    var categoryName = $('#cat-categoryName').val();
                    var topic = $('#cat-topic').val();
                    var categoryCode = $('#cat-categoryCode').val();
                    var description = $('#cat-description').val();
                    var priority = $('#cat-priority').val();

                    $.ajax({
                        type: 'POST',
                        contentType: 'application/json',
                        url: '${pageContext.request.contextPath}/category/'+categoryId+'/appendChild',
                        processData: false,
                        dataType: 'json',
                        data : '{"parentId":\"'+parentId+'\","parentIds":\"'+parentIds+'\","categoryName":\"'+categoryName+'\","categoryCode":\"'+categoryCode+'\","description":\"'+description+'\","priority":\"'+priority+'\","topic":\"'+topic+'\"}',
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


    function ceditChild(categoryId) {
        var d = $('<div/>').dialog({
            width : 300,
            height : 270,
            href : '${pageContext.request.contextPath}/category/'+categoryId+'/update',
            modal : true,
            align : 'center',
            title : '修改子节点',
            buttons : [ {
                text : '修改',
                handler : function() {
                    var id = $('#cat-id').val();
                    var parentId = $('#cat-parentId').val();
                    var parentIds = $('#cat-parentIds').val();
                    var categoryName = $('#cat-categoryName').val();
                    var topic = $('#cat-topic').val();
                    var categoryCode = $('#cat-categoryCode').val();
                    var description = $('#cat-description').val();
                    var priority = $('#cat-priority').val();
                    $.ajax({
                        type: 'POST',
                        contentType: 'application/json',
                        url: '${pageContext.request.contextPath}/category/'+categoryId+'/update',
                        processData: false,
                        dataType: 'json',
                        data : '{"id":\"'+id+'\","parentId":\"'+parentId+'\","parentIds":\"'+parentIds+'\","categoryName":\"'+categoryName+'\","categoryCode":\"'+categoryCode+'\","description":\"'+description+'\","priority":\"'+priority+'\","topic":\"'+topic+'\"}',
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

    function cdeleteChild(categoryId) {
        $.ajax({
            type: 'delete',
            contentType: 'application/json',
            url: '${pageContext.request.contextPath}/category/'+categoryId,
            processData: false,
            dataType: 'json',
                success: function(data) {
                var currTab =  $('#lyout_center_tabs').tabs('getSelected'); //获得当前tab
                currTab.panel('refresh');
            },
            error: function() {
                alert('此类别正在使用,不允许删除!');
            }
        });
    }
</script>
</body>
</html>