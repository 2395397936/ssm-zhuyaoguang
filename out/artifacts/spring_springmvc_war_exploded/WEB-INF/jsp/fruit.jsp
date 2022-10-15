<%@ page import="org.example.ss.po.Fruit" %>
<%@ page import="java.util.List" %><%--

  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/10/11
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="org.example.ss.po.Fruit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    List<Fruit> fruitList = (List) request.getAttribute("fruitList");
%>
<h3>新鲜水果</h3>
<table width="300px" border="1">
    <c:forEach items="${fruitList}" var="fruit">
        <tr>
            <td>${fruit.name}</td>
            <td>${fruit.price}</td>
            <td>${fruit.price}</td>
            <td>${fruit.producingArea}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
