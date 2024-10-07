<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>We-Link</title>
    <!-- Add Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            transition: margin-left 0.3s; /* Smooth transition when sidebar is toggled */
        }

        /* Top navbar */
        .top-nav {
            display: flex;
            align-items: center;
            background-color: #333;
            padding: 2px 20px; /* Adjust padding for height and spacing */
            color: white;
            height: 80px; /* Set a specific height if needed */
            position: relative; /* Enable absolute positioning for nav-right */
        }

        /* Centering the brand text */
        .brand-toggle {
            display: flex;
            flex-direction: column; /* Stack brand and toggle button vertically */
            align-items: center; /* Center the items */
            flex-grow: 1; /* Allow the brand section to take available space */
        }

        /* Styling the brand text */
        .top-nav .brand {
            font-size: 24px;
            font-weight: bold;
            text-align: center; /* Center the text */
        }

        /* Positioning nav-right to the far right */
        .top-nav .nav-right {
            position: absolute;
            right: 20px; /* Keep it aligned to the right */
            display: flex;
            gap: 20px;
        }

        .top-nav .nav-right a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        /* Sidebar styles */
        .side-nav {
            width: 200px;
            position: fixed;
            top: 10;
            left: -200px; /* Hidden by default */
            background-color: #333;
            height: 100%;
            padding-top: 60px; /* Leave space for top navbar */
            transition: left 0.3s; /* Smooth transition */
        }

        .side-nav.open {
            left: 0; /* Visible when open */
        }

        .side-nav a {
            padding: 15px 20px;
            text-align: left;
            color: white;
            text-decoration: none;
            display: block;
        }

        .side-nav a i {
            margin-right: 10px;
        }

        .side-nav a:hover {
            background-color: #575757;
        }

        /* Toggle button for sidebar */
        .toggle-btn {
            position: absolute;
            left: 20px;
            top: 20px;
            font-size: 24px;
            cursor: pointer;
            color: white;
        }

        /* Main content styling */
        .main-content {
            margin-left: 0; /* No margin initially */
            padding: 20px;
            padding-top: 80px;
            transition: margin-left 0.3s; /* Smooth transition */
        }

        /* Login form styling */
        .login-form {
            max-width: 500px; /* Increased max width for the form */
            margin: 0 auto; /* Center the form horizontally */
            background-color: #f4f4f4; /* Light background for the form */
            padding: 30px; /* Increased padding for better spacing */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
        }

        .login-form label {
            display: block; /* Make labels block elements */
            margin-bottom: 10px; /* Spacing below labels */
            font-weight: bold; /* Bold labels */
            color: #003366; /* Dark color for labels */
        }

        .login-form input[type="text"],
        .login-form input[type="password"] {
            width: 95%; /* Full width inputs */
            padding: 12px; /* Increased padding for better touch area */
            margin-bottom: 15px; /* Adjusted spacing below inputs */
            border: 1px solid #ccc; /* Light gray border */
            border-radius: 5px; /* Rounded corners for inputs */
            font-size: 16px; /* Font size */
        }

        .login-form input[type="submit"] {
            width: 100%; /* Full width for the submit button */
            padding: 12px; /* Increased padding for the button */
            background-color: #003366; /* Button background color */
            color: white; /* Button text color */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners for button */
            font-size: 16px; /* Font size */
            cursor: pointer; /* Pointer cursor on hover */
            transition: background-color 0.3s; /* Smooth transition on hover */
        }

        .login-form input[type="submit"]:hover {
            background-color: #00509e; /* Darker shade on hover */
        }

        /* Message and register link styling */
        .message {
            color: #ff0000; /* Red color for error messages */
            text-align: center; /* Center the message */
            margin-bottom: 20px; /* Space below the message */
        }

        .register-link {
            text-align: center; /* Center-align the register link */
            margin-top: 20px; /* Space above the link */
        }

        .register-link a {
            color: #003366; /* Link color */
            text-decoration: underline; /* Underline for links */
        }

        .register-link a:hover {
            color: #00509e; /* Change color on hover */
        }

        /* Flexbox layout for text and image */
        .content-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #D3D3D3; /* Similar to the beige color */
            padding: 50px;
            border-radius: 10px;
        }

        .content-section .text-content {
            max-width: 50%;
        }

        .content-section h1 {
            font-size: 36px;
            color: #003366;
        }

        .content-section p {
            font-size: 18px;
            color: #333;
        }

        .content-section img {
            max-width: 40%;
            border-radius: 10px;
        }

        .careerscope-section {
            padding: 20px; /* Add some padding */
            background-color: #f4e6d4; /* Use the same background color as content-section */
            border-radius: 10px; /* Rounded corners */
            margin-top: 20px; /* Space above this section */
            text-align: center; /* Center-align the text */
        }

        .careerscope-section h2 {
            font-size: 28px; /* Adjust size for the heading */
            color: #003366; /* Use a contrasting color for the heading */
        }

        .careerscope-section p {
            font-size: 16px; /* Adjust size for the paragraph */
            color: #333; /* Standard text color */
            line-height: 1.5; /* Improved line spacing for readability */
        }
    </style>
</head>

<body>
    <!-- Top navigation bar -->
    <div class="top-nav">
        <!-- Brand and toggle icon in a container -->
        <div class="brand-toggle">
            <div class="brand">We-Link</div>
            <!-- Sidebar toggle button below the brand -->
            <i class="fas fa-bars toggle-btn" onclick="toggleSidebar()"></i>
        </div>

        <div class="nav-right">
                    <a href="login"><i class="fas fa-bell"></i></a>
        
            <a href="login"><i class="fas fa-user"></i> Profile</a>
            <a href="login"><i class="fas fa-sign-in-alt"></i> Login</a>
        </div>
    </div>

    <!-- Side navigation bar -->
    <div id="sideNav" class="side-nav">
        <a href="home"><i class="fas fa-home"></i> Home</a>
        <a href="login"><i class="fas fa-briefcase"></i> Jobs</a>
        <a href="login"><i class="fas fa-file-alt"></i> Test</a>
        <a href="login"><i class="fas fa-lightbulb"></i> Suggestions</a>
                <a href="login"><i class="fas fa-file"></i> Resume</a>
        <a href="login"><i class="fas fa-microphone"></i> Conference</a>
        <a href="help"><i class="fas fa-question-circle"></i> Help</a>
    </div>

    <!-- Main content area -->
    <div class="main-content" id="mainContent">

        <!-- Display message if available -->
        <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
        %>
        <p class="message"><%=message%></p>
        <%
        }
        %>

        <form class="login-form" action="add-user" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <input type="submit" value="Register">
        </form>

        <div class="register-link">
            <p>Already have an account? <a href="login">Login here</a></p>
        </div>

    </div>

    <script>
        function toggleSidebar() {
            const sideNav = document.getElementById("sideNav");
            const mainContent = document.getElementById("mainContent");
            sideNav.classList.toggle("open");
            mainContent.style.marginLeft = sideNav.classList.contains("open") ? "200px" : "0"; // Adjust main content margin
        }
    </script>
</body>

</html>
