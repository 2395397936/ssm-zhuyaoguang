<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> %</title>
    <link href="${pageContext.request.contextPath}/css/regcss.css" type="text/css" rel="stylesheet"/>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("username").value === "") {
                alert("用户名不能为空")
                document.getElementById("username").focus();
                return false;
            } else if (document.getElementById("password").value === "") {
                alert("密码不能为空")
                document.getElementById("password").focus();
                return false;
            } else if (document.getElementById("name").value === "") {
                alert("姓名不能为空")
                document.getElementById("name").focus();
                return false;
            } else if (document.getElementById("telephone ").value === ""
                || /^1[34578]\d(9)$/.test(document.getElementById(("telephone").value))) {
                alert("手机号格式有误")
                document.getElementById("telephone").focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div id="content">
    <div id="form">
        <h1>用户注册</h1><br/>
        <form action="register.action" method="post" id="myform"
              onsubmit="return validate()">
            用户名<input type="text" id="username" name="username"
                         style="width:190px ; height:26px;margin-left : 39px;"/><br/>
            密码<input type="password" id="password" name="password"
                       style="width: 190px ; height : 26px ; margin-top:8px;margin-left:54px;"/><br/>
            姓名<input type="text" id="name" name="name"
                       style="width :190px ; height:26px;margin-top:8px;margin-left: 54px;"/><br/>
            手机号<input type="text" id="telephone" name="telephone"
                         style="width:190px;height : 26px; margin-top:8px ; margin-left : 39px;"/><br/>
            <input type="submit" value="注册"
                   style="width:50px ; height:30px; margin-top:5px;"/>
            <a href=toLogin.action>返回登录</a>
        </form>
        <%--                ！一 显示错误信息--%>
        <c:if test="${ errorMsg!=null } ">
            <font color="red">${errorMsg}</font>
        </c:if>
    </div>
</div>
</body>
</html>
