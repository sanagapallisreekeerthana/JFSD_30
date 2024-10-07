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

        .main-content.with-sidebar {
            margin-left: 200px; /* Adjust when sidebar is open */
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
                <a href="#"><i class="fas fa-bell"></i></a>
    
            <a href="/exp-6/views/profile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="home"><i class="fas fa-sign-in-alt"></i> Logout</a>
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
<div id="mainContent" class="main-content">
    <div class="content-section">
        <div class="text-content">
            <h1>Matching job seekers to careers by discovering what they do best.</h1>
            <p>We-Link is a comprehensive platform designed to match job seekers to the right career paths based on their skills and interests.</p>
        </div>
        <img src="https://png.pngtree.com/thumb_back/fh260/background/20230705/pngtree-cartoon-illustration-of-a-child-gamer-engrossed-in-video-game-on-image_3744230.jpg" alt="Career assessment illustration">
    </div>

    <!-- New section for WHY CAREERSCOPE? -->
    <div class="careerscope-section">
        <h2>WHY WE-LINK?</h2>
        <p>An essential ingredient in your career guidance toolkit. We-Link is an assessment tool for career advisors that allows you to measure your clients unique abilities and interests to design optimal career pathways. What they discover through CareerScope expands possibilities in ways that ignites new levels of confidence and excitement for you and your job seeker, together.</p>
    </div>
</div>


    <script>
        function toggleSidebar() {
            const sideNav = document.getElementById('sideNav');
            const mainContent = document.getElementById('mainContent');
            if (sideNav.classList.contains('open')) {
                sideNav.classList.remove('open');
                mainContent.classList.remove('with-sidebar');
            } else {
                sideNav.classList.add('open');
                mainContent.classList.add('with-sidebar');
            }
        }
    </script>

</body>

</html>
