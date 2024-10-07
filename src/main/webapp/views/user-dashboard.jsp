<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>User Dashboard</title>
</head>
<body>
	<h2>User Dashboard</h2>

	<%
	// Retrieve the user object and message from the request scope
	com.jfsd_lab.exp_6.model.User user = (com.jfsd_lab.exp_6.model.User) request.getAttribute("user");
	String message = (String) request.getAttribute("message");

	if (message != null) {
	%>
	<p><%=message%></p>
	<%
	}
	%>

	<br>
	<br>
	<p>
		Welcome to your dashboard,
		<%=user.getUsername()%>! You are a regular user.
	</p>

	<a href="<%=request.getContextPath()%>/logout">Logout</a>
	<a href="register-events">Register events</a>
	<a href="registered-events">My Registered events</a>
</body>
</html>
