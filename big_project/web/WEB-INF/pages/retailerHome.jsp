<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional //EN">
<html>
<head>
    <title>零售商管理</title>
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
            姓名：<input type="text" id="addName" name="name" style=
                "width: 120px"/><br/>
            手机：<input type="text" id="addTelephone" name="telephone" style=
                "width: 120px"/><br/>
            地址：<input type="text" id="addAddress" name="address" style=
                "width: 120px"/><br/>
            <input type="hidden" name="status" value="1"/>
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
            姓名：<input type="text" id="editName" name="name" style=
                "width: 120px"/><br/>
            手机：<input type="text" id="editTelephone" name="telephone" style=
                "width: 120px"/><br/>
            地址：<input type="text" id="editAddress" name="address" style=
                "width: 120px"/><br/>
            状态：
            <select id="eStatus" onchange="changeEditStatus()">
                <option value="1">启用</option>
                <option value="0">停用</option>
            </select>
            <br/>
            <input type="hidden" name="retailerId" id="retailerId"/>
            <input type="hidden" name="status" id="editStatus"/>
            <input type="hidden" name="startPage" id="eStartPage"/>
            <input type="hidden" name="currentPage" id="eCurrentPage"/>
            <input type="hidden" name="pageSize" id="ePageSize"/>
            <input type="submit" value="提 交" style="background-color: #173e65;
            color: #ffffff;width: 70px;margin-left: 70px;cursor:pointer;margin-top: 10px;"/>
        </form>
    </div>
</div>
<%@ include file="menu.jsp" %>
<br/>
<form id="listForm" action="list.action" method="post">
    姓名：<input type="text" name="name" style="width: 120px"/>
    手机：<input type="text" name="telephone" style="width: 120px"/>
    地址：<input type="text" name="address" style="width: 120px"/>
    状态：
    <select id="indexStatus" onchange="changeStatus()">
    <option value="-1" selected="selected">全部</option>
    <option value="1">启用</option>
    <option value="0">停用</option>
</select>
    <input type="hidden" name="status" id="status" value="-1"/>
<%--    创建日期：<input type="datetime-local" name="createTime"/>--%>
    <input type="submit" value="搜索" style="background-color: #173e65; color:
   #ffffff; width: 70px;"/><br/>
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
<hr style="margin-top: 10px;"/>
<button onclick="showAddMask('true')" style="background-color: #173e65;color:
#ffffff;width: 70px;">添加</button>


<c:if test="${list!=null}">
    <table style="margin-top: 10px;width: 700px;text-align: center;" border=1>
        <tr>
            <td>序号</td>
            <td>姓名</td>
            <td>手机号</td>
            <td>地址</td>
            <td>状态</td>
            <td>创建日期</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${list}" var="item" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${item.name}</td>
                <td>${item.telephone}</td>
                <td>${item.address}</td>
                <td>
                    <c:if test="${item.status==1}">
                        <font color="blue">启用</font>
                    </c:if>
                    <c:if test="${item.status==0}">
                        <font color="red">停用</font>
                    </c:if>
                </td>
                <td>${item.createTime}</td>
                <td>
                    <a onclick="deleteRetailer('${item.retailerId}','${item.name}')">删除</a>
                    | <a onclick="editRetailer('${item.retailerId}');">编辑</a>

                    <form id="deleteForm" action="delete.action" method="post">
                        <input type="hidden" name="retailerId" id="dRetailerId"/>
                        <input type="hidden" name="startPage" id="dStartPage"/>
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

<div style="margin-top: 10px">
    <a onclick="toPrePage()">上一页</a><a onclick="toNextPage()">下一页</a>
    <input type="text" id="pageNumber" style="width: 50px">
    <button onclick="toLocationPage()">go</button>
    <div id="pageInfo"></div>
</div>


</body>
</html>
<script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/retailerHome.js"></script>