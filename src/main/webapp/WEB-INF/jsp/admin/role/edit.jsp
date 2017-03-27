<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%--<title></title>--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/css.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css">--%>


</head>
<body>




        <div class="container">
                <h3>资源:</h3>
                 <input id="resourceId" type="hidden"/>
                <textarea id="resourceName" type="text" readonly value="" style="width:100%;height: 50px" onclick="showMenu();" />
                <a id="menuBtn" href="#" onclick="showMenu()">选择资源</a>
        </div>



<script>

        var setting = {
            check: {
                enable: true ,
                chkboxType: { "Y": "", "N": "" }
            },
            view: {
                dblClickExpand: false
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                onCheck: onCheck
            }
        };

        var zNodes =[
            <c:forEach items="${resourceList}" var="r">
            <c:if test="${not r.rootNode}">
            { id:${r.id}, pId:${r.parentId}, name:"${r.name}", checked:${r.check}},
            </c:if>
            </c:forEach>
        ];

        function onCheck(e, treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("tree"),
                    nodes = zTree.getCheckedNodes(true),
                    id = "",
                    name = "";
            nodes.sort(function compare(a,b){return a.id-b.id;});
            for (var i=0, l=nodes.length; i<l; i++) {
                id += nodes[i].id + ",";
                name += nodes[i].name + ",";
            }
            if (id.length > 0 ) id = id.substring(0, id.length-1);
            if (name.length > 0 ) name = name.substring(0, name.length-1);
            $("#resourceId").val(id);
            $("#resourceName").val(name);
//                hideMenu();
        }

        function showMenu() {
            var cityObj = $("#resourceName");
            var cityOffset = $("#resourceName").offset();
            $("#menuContent").css({left:30 + "px", top:130 + "px"}).slideDown("fast");

            $("body").bind("mousedown", onBodyDown);
        }
        function hideMenu() {
            $("#menuContent").fadeOut("fast");
            $("body").unbind("mousedown", onBodyDown);
        }
        function onBodyDown(event) {
            if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
                hideMenu();
            }
        }
        $(function () {
        $.fn.zTree.init($("#tree"), setting, zNodes);
        $("#menuBtn").click(showMenu);
    });

</script>

<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
    <ul id="tree" class="ztree" style="margin-top:0; width:180px;height: 200px"></ul>
</div>
</body>
</html>