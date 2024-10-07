<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            transition: margin-left 0.3s;
        }

        /* Container styling */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
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
            top: 100;
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

        .side-nav a i {
            margin-right: 10px;
        }

        .side-nav a:hover {
            background-color: #575757;
        }

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
            padding-top: 80px;
            transition: margin-left 0.3s;
        }

        .main-content.with-sidebar {
            margin-left: 200px;
        }

        /* Job roles in cards */
        .card-container {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .card {
            flex: 1;
            min-width: 250px;
            background-color: #f1f1f1;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card h3 {
            color: #003366;
            margin-bottom: 10px;
        }

        .card p {
            color: #333;
        }
    </style>
</head>

<body>

    <!-- Top navigation bar -->
    <div class="top-nav">
        <div class="brand-toggle">
            <div class="brand">We-Link</div>
            <i class="fas fa-bars toggle-btn" onclick="toggleSidebar()"></i>
        </div>
        <div class="nav-right">
            <a href="#"><i class="fas fa-bell"></i></a>
                        <a href="profile"><i class="fas fa-user"></i> Profile</a>
            
            <a href="logout"><i class="fas fa-sign-in-alt"></i> Logout</a>
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

    <div class="container">
        <div class="main-content" id="mainContent">
            <h2>Job Suggestions</h2>

            <!-- Dropdown for selecting specialization -->
            <label for="specialization">Select Specialization:</label>
            <select id="specialization" onchange="showJobRoles()">
                <option value="">--Select--</option>
                <option value="AI">Artificial Intelligence (AI)</option>
                <option value="DS">Data Science (DS)</option>
                <option value="Cyber">Cybersecurity (Cyber)</option>
            </select>

            <!-- Container to display job roles in card format -->
            <div id="jobRoles">
                <p>Please select a specialization to view the job roles.</p>
            </div>
        </div>
    </div>

    <script>
        let isSidebarOpen = false;

        function toggleSidebar() {
            const sideNav = document.getElementById('sideNav');
            const mainContent = document.getElementById('mainContent');

            if (!isSidebarOpen) {
                sideNav.classList.add('open');
                mainContent.classList.add('with-sidebar');
            } else {
                sideNav.classList.remove('open');
                mainContent.classList.remove('with-sidebar');
            }

            isSidebarOpen = !isSidebarOpen;
        }

        // Function to display job roles based on the selected specialization
        function showJobRoles() {
            const specialization = document.getElementById("specialization").value;
            const jobRolesContainer = document.getElementById("jobRoles");
            let jobRoles = "";

            if (specialization === "AI") {
                jobRoles = `
                    <div class="card-container">
                        <div class="card">
                            <h3>Machine Learning Engineer</h3>
                            <p>Develop algorithms and models that allow computers to learn and make decisions from data.</p>
                            <a href="#">Apply now</a>
                        </div>
                        <div class="card">
                            <h3>AI Research Scientist</h3>
                            <p>Conduct advanced research to push the boundaries of artificial intelligence and machine learning technologies.</p>
                            <a href="#">Apply now</a>

                        </div>
                        <div class="card">
                            <h3>AI Data Analyst</h3>
                            <p>Analyze large sets of data to extract meaningful insights and drive AI development efforts.</p>
                            <a href="#">Apply now</a>

                        </div>
                    </div>
                `;
            } else if (specialization === "DS") {
                jobRoles = `
                    <div class="card-container">
                        <div class="card">
                            <h3>Data Scientist</h3>
                            <p>Use statistical and computational techniques to analyze data and extract actionable insights.</p>
                            <a href="#">Apply now</a>
                            
                            </div>
                        <div class="card">
                            <h3>Data Analyst</h3>
                            <p>Analyze data sets to identify trends, patterns, and insights for decision-making.</p>
                            <a href="#">Apply now</a>

                        </div>
                        <div class="card">
                            <h3>Data Engineer</h3>
                            <p>Design and maintain systems for collecting, storing, and analyzing large amounts of data.</p>
                            <a href="#">Apply now</a>

                        </div>
                    </div>
                `;
            } else if (specialization === "Cyber") {
                jobRoles = `
                    <div class="card-container">
                        <div class="card">
                            <h3>Cybersecurity Analyst</h3>
                            <p>Monitor and protect networks and systems from cyber threats and attacks.</p>
                            <a href="#">Apply now</a>

                        </div>
                        <div class="card">
                            <h3>Network Security Engineer</h3>
                            <p>Design, implement, and maintain secure network infrastructures.</p>
                            <a href="#">Apply now</a>

                        </div>
                        <div class="card">
                            <h3>Ethical Hacker</h3>
                            <p>Perform penetration testing to identify and fix vulnerabilities in systems before malicious hackers can exploit them.</p>
                            <a href="#">Apply now</a>

                        </div>
                    </div>
                `;
            } else {
                jobRoles = "<p>Please select a specialization.</p>";
            }

            jobRolesContainer.innerHTML = jobRoles;
        }
    </script>

</body>

</html>