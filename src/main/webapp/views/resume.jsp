<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resume Upload</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            transition: margin-left 0.3s;
            background-color: #f0f0f0; /* Light gray background for contrast */
        }

        /* Top navbar */
        .top-nav {
            display: flex;
            align-items: center;
            background-color: #333;
            padding: 2px 20px;
            color: white;
            height: 80px;
            position: relative;
        }

        /* Centering the brand text */
        .brand-toggle {
            display: flex;
            flex-direction: column;
            align-items: center;
            flex-grow: 1;
        }

        .top-nav .brand {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
        }

        /* Positioning nav-right to the far right */
        .top-nav .nav-right {
            position: absolute;
            right: 20px;
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
            left: -200px;
            background-color: #333;
            height: 100%;
            padding-top: 60px;
            transition: left 0.3s;
        }

        .side-nav.open {
            left: 0;
        }

        .side-nav a {
            padding: 15px 20px;
            color: white;
            text-decoration: none;
            display: block;
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
            margin-left: 0;
            padding: 20px;
            padding-top: 80px;
            transition: margin-left 0.3s;
        }

        .main-content.with-sidebar {
            margin-left: 200px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff; /* White background */
            border-radius: 10px; /* Slightly more rounded corners */
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2); /* Softer shadow */
            padding: 30px;
            border: 1px solid #ddd; /* Light gray border */
            transition: transform 0.2s; /* Smooth scaling */
        }

        .container:hover {
            transform: scale(1.02); /* Slight scale effect on hover */
        }

        h1 {
            text-align: center;
            color: #003366; /* Deep blue color */
            margin-bottom: 20px; /* Space below the title */
        }

        label {
            font-size: 18px;
            margin-bottom: 10px;
            display: block;
            color: #555; /* Darker gray for the label */
        }

        input[type="file"] {
            display: block;
            margin-bottom: 20px;
            border: 1px solid #ccc; /* Light border for file input */
            border-radius: 5px; /* Rounded corners for file input */
            padding: 10px; /* Padding inside file input */
            width: 100%; /* Full width */
            font-size: 16px; /* Font size */
        }

        button {
            padding: 10px 20px;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.2s; /* Smooth background color transition */
        }

        button:hover {
            background-color: #0055aa; /* Darker blue on hover */
        }

        .score {
            margin-top: 20px;
            font-size: 24px;
            color: #007700;
            text-align: center;
        }
    </style>
</head>
<body>

    <!-- Top navigation bar -->
    <div class="top-nav">
        <!-- Brand and toggle icon in a container -->
        <div class="brand-toggle">
            <i class="fas fa-bars toggle-btn" onclick="toggleSidebar()"></i>
        </div>

        <div class="nav-right">
                    <a href="#"><i class="fas fa-bell"></i></a>
        
            <a href="profile"><i class="fas fa-user"></i> Profile</a>
            <a href="/exp-6/views/home.jsp"><i class="fas fa-sign-in-alt"></i> Logout</a>
        </div>
    </div>

    <!-- Side navigation bar -->
<div id="sideNav" class="side-nav">
    <a href="/exp-6/views/home2.jsp"><i class="fas fa-home"></i> Home</a>
    <a href="/exp-6/views/jobs.jsp"><i class="fas fa-briefcase"></i> Jobs</a>
    <a href="#"><i class="fas fa-file-alt"></i> Test</a>
    <a href="#"><i class="fas fa-lightbulb"></i> Suggestions</a>
    <a href="views/resume.jsp"><i class="fas fa-file"></i> Resume</a>
    <a href="#"><i class="fas fa-microphone"></i> Conference</a>
    <a href="#"><i class="fas fa-question-circle"></i> Help</a>
</div>

    <!-- Main content area -->
    <div class="main-content">
        <div class="container">
            <h1>Upload Your Resume</h1>
            <form method="post" enctype="multipart/form-data">
                <br>
                <label for="resume">Upload your resume to get your ATS score:</label>
                <input type="file" id="resume" name="resume" accept=".pdf,.doc,.docx" required>
                <button type="submit">Submit</button>
            </form>

            <%
                if (request.getMethod().equalsIgnoreCase("POST")) {
                    int atsScore = 60 + (int) (Math.random() * (85 - 60 + 1));
            %>
                <div class="score">
                    <p>Your ATS score is: <strong><%= atsScore %></strong></p>
                </div>
            <%
                }
            %>
        </div>
    </div>

    <script>
        function toggleSidebar() {
            const sideNav = document.getElementById('sideNav');
            const mainContent = document.querySelector('.main-content');
            sideNav.classList.toggle('open');
            mainContent.classList.toggle('with-sidebar');
        }
    </script>
</body>
</html>