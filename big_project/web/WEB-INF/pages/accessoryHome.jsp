<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/retailerHome.css">
</head>
<body>
<div class="addAccessoryMask" style="width: 100%;height: 100%; position: absolute;background: rgba(0, 0, 0, .3);display: none;">
  <div class="c">
    <div style="background-color: #173e65;height: 20px;color: #ffffff;
font-size: 12px;padding-right: 7px">
      添加附属品信息
      <font style="float: right;padding-right: 10px;cursor:pointer;" onclick=
              "showAddAccessory('false')">x</font>
    </div>
    <form id="addAccessoryForm"  method="post" style="margin-top: 10px;">
      名称：<input type="text" id="addAccessoryName"
                  name="name" style="width: 120px"/><br/>
      价格：<input type="text" id="addAccessoryPrice"
                  name="price" style="width: 120px"/>
      <input type="hidden" id="aFruitId" name="fruitId" value="${fruitId}"/>
      <input  value="添 加" onclick="add()"
             style="cursor:pointer;background-color: #173e65;color: #ffffff;width: 70px;margin-left: 70px;margin-top: 10px;"/>
    </form>
  </div>
</div>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<button onclick="showAddAccessory('ture')"
        style="background-color: #173e65;color: #ffffff;width: 70px">添加</button>
<button onclick="deleteAccessory()"
        style="background-color: #173e65;color: #ffffff;width: 70px">删除</button>
<c:if test="${list!=null}">
  <table style="margin-top: 10px;width: 400px;text-align: center;" border="1">
    <tr>
      <td><input type="checkbox" onclick="checkAll(this)"></td>
      <td>id</td>
      <td>名称</td>
      <td>价格</td>
      <td>创建日期</td>
    </tr>
    <c:forEach items="${list}" var="item" varStatus="status">
      <tr>
        <td><input type="checkbox" name="arrays" class="arrays" value="${item.accessoryId}"></td>
        <td>${item.accessoryId}</td>
        <td>${item.name}</td>
        <td>${item.price}</td>
        <td>${item.createTime}</td>
      </tr>
    </c:forEach>
  </table>
</c:if>
<c:if test="${list==null}">
  <b>结果为空！</b>
</c:if>

</body>
</html>

<script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/accessoryHome.js" type="text/javascript"></script>
