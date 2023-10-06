<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <%@ include file="css.jsp" %>
</head>

<body>
	<%@ include file="menu.jsp" %>

    <div style="width:60%;margin:auto;text-align:center;">
    	<h2>Welcome <span class="text-warning"><%= request.getSession().getAttribute("username")%></span></h2>
    	<h3><%= request.getSession().getAttribute("count")!=null ?"You hit this page"+ request.getSession().getAttribute("count")+" Time!":""%></h3>
    </div>


</body>

</html>