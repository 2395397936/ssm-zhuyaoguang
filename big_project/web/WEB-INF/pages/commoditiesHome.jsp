<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/retailerHome.css" type="text/css">
</head>
<body onload="init()">
<div class="addMask">
    <div class="c">
        <div style="background-color: #173e65;height: 20px;color: #ffffff;font-size:
12px;padding-left: 7px;">
            添加信息
            <font style="float: right;padding-right: 10px;" onclick="showAddMask
            ('false')"><p style="cursor:pointer;">x</p></font>
        </div>
        <form id="addForm" action="add.action" method="post" onsubmit=
                "checkAddRetailer()" style="margin-top: 5px;">
            名称：<input type="text" id="addName" name="name" style=
                "width: 120px"/><br/>
            价格：<input type="text" id="addPrice" name="price" style=
                "width: 120px"/><br/>
            地址：<input type="text" id="addLocality" name="locality" style=
                "width: 120px"/><br/>
            <input type="submit" value="添 加" style="background-color: #173e65;
            color: #ffffff;width: 70px;margin-left: 70px;cursor:pointer;margin-top: 10px;"/>
        </form>
    </div>
</div>
<div class="mask">
    <div class="c">
        <div style="background-color: #173e65;height: 20px;color: #ffffff;font-size:
12px;padding-left: 7px;">
            修改信息：<font style="float: right;padding-right: 10px;" onclick=
                "cancelEdit()"><p style="cursor:pointer;">x</p></font>
        </div>
        <form id="editFrom" action="edit.action" method="post">
            名称：<input type="text" id="editName" name="name" style=
                "width: 120px"/><br/>
            价格：<input type="text" id="editPrice" name="price" style=
                "width: 120px"/><br/>
            地址：<input type="text" id="editLocality" name="locality" style=
                "width: 120px"/><br/>
            <br/>
            <input type="hidden" name="fruitId" id="FruitId"/>
            <input type="hidden" name="startPage" id="eStartPage"/>
            <input type="hidden" name="currenPage" id="eCurrentPage"/>
            <input type="hidden" name="pageSize" id="ePageSize"/>
            <input type="submit" value="提 交" style="background-color: #173e65;
            color: #ffffff;width: 70px;margin-left: 70px;cursor:pointer;margin-top: 10px;"/>
        </form>
    </div>
</div>
<%@ include file="menu.jsp" %>

<form id="listForm" action="list.action" method="post">
    名称：<input type="text" name="name" style="width: 120px" value=
        "${commodities.name}"/>
    产地：<input type="text" name="locality" style="width: 120px" value=
        "${commodities.locality}"/>
    价格：<input id="price1" name="startPrice" type="number"
                min="0.0" step="0.1" value="${startPrice}"/>
    - <input id="price2" name="endPrice" type="number"
            min="0.0" step="0.1" value="${endPrice}"/><br/><br/>
    创建日期：<input type="datetime-local" name="startTime" value="${startTime}"/>
    -<input type="datetime-local" name="endTime" value="${endTime}"/>
    <input type="submit" value="搜索"
           style="background-color: #173e65;color: #ffffff;width: 70px;"/><br/>
    <!--显示错误信息-->
    <c:if test="${errorMsg}">
        <font color="red">${errorMsg}</font><br/>
    </c:if>
    <input type="hidden" name="startPage" id="startPage" value="${startPage}"/>
    <input type="hidden" name="currentPage" id="currentPage" value="${currentPage}"/>
    <input type="hidden" name="pageSize" id="pageSize" value="${pageSize}"/>
    <input type="hidden" name="sumPageNumber"
           id="sumPageNumber" value="${sumPageNumber}"/>
    <input type="hidden" name="countNumber" id="countNumber" value="${countNumber}"/>
</form>
<button onclick="showAddMask('true')" style="background-color: #173e65;color:
#ffffff;width: 70px;">
    添加
</button>
<c:if test="${list!=null}">
    <table style="margin-top: 10px;width: 700px;text-align: center;" border=1>
        <tr>
            <td>序号</td>
            <td>姓名</td>
            <td>价格</td>
            <td>地址</td>
            <td>创建日期</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${list}" var="item" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${item.name}</td>
                <td>${item.price}</td>
                <td>${item.locality}</td>
                <td>${item.createTime}</td>
                <td>
                    <a onclick="editCommodities('${pageContext.request.contextPath}','${item.fruitId}')">编辑</a> |
                    <a onclick="deleteCommodities('${item.fruitId}',
                            '${item.name}')">删除</a> |
                    <a onclick="openwin('${pageContext.request.contextPath}','${item.fruitId}')">附属品</a>
                    <form id="deleteForm" action="delete.action" method="post">
                        <input type="hidden" name="fruitId" id="dFruitId"/>
                        <input type="hidden" name="statePage" id="dStatePage"/>
                        <input type="hidden" name="currentPage" id="dCurrentPage"/>
                        <input type="hidden" name="pageSize" id="dPageSize"/>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${list==null}">
    <b>搜索结果为空！</b>
</c:if>
<div style="margin-top: 10px;">
    <a onclick="toPrePage()">上一页</a><a onclick="toNextPage()">下一页</a>
    <input type="text" id="pageNumber" style="width: 50px">
    <button onclick="toLocationPage()">go</button>
    <div id="pageInfo"></div>
</div>


</body>

</html>
<script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/commoditiesHome.js" type="text/javascript"></script>
