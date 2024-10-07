<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Admin Dashboard</title>
</head>
<body>

	<h2>Admin Dashboard</h2>

	<%
	// Retrieve user from session
	com.jfsd_lab.exp_6.model.User user = (com.jfsd_lab.exp_6.model.User) session.getAttribute("user");
	String message = (String) session.getAttribute("message");

	if (message != null) {
	%>
	<p><%=message%></p>
	<%
	// Clear message after displaying
	session.removeAttribute("message");
	}

	if (user != null) {
	%>
	<p>
		ID:
		<%=user.getId()%></p>
	<br>
	<p>
		Welcome Admin,
		<%=user.getName()%>! You have admin privileges.
	</p>
	<%
	} else {
	%>
	<p>User not found in session. Please log in again.</p>
	<%
	}
	%>

	<a href="<%=request.getContextPath()%>/logout">Logout</a>
	<br />
	<a href="add-event">Add Event</a>
	<br />
	<a href="manage-events">Manage Events</a>
</body>
</html>
