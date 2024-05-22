<%@page import="com.smsb.entities.User"%>
<%
User users = (User) session.getAttribute("user");

if (users == null) {

	response.sendRedirect("login");
	return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Sidebar Toggle</title>
<!-- Include Font Awesome for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<!-- Styles for sidebar and other elements -->
<style>
/* Sidebar styling */
.sidebar {
	width: 280px;
	height: 93vh;
	position: relative;
	background: #f2f2f2;
	padding: 15px;
	transition: 0.5s;
	left: 0px;
	right: 280px;
	display:block;
}

.sidebar.open {
	right: 0px;
	left: -280px;
	display: none !important;

	/* Shows the sidebar */
}

.toggle-button {
	cursor: pointer;
	position: absolute; /* Keep it in a consistent spot */
	top: 20px;
	left: 400px;
}
}
</style>
</head>
<body>
	<!-- Toggle Button to control sidebar -->
	<div class="mt-3 barbtn">
		<a class="toggle-button text-decoration-none text-white"
			onclick="toggleSidebar()"> <i class="fa-solid fa-bars fa-xl"></i>
		</a>
	</div>

	<!-- Sidebar with toggle functionality -->
	<div class="sidebar" id="sidebar">
		<div class="d-flex justify-content-center align-items-center">
			<a href="/"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
				<span class="fs-4">EMS</span>
			</a> <a type="button" onclick="toggleSidebar()"> <i
				class="fa-solid fa-xmark fa-xl"></i>
			</a>
		</div>
		<hr>
		<ul class="nav nav-pills flex-column mb50">
			<li class="nav-item"><a href="${contextRoot}/dashboard"
				class="nav-link text-black item" id="profile-link"><i
					class="fa-solid fa-user me-3"></i>Profile</a></li>
			<li><a href="${contextRoot}/addEmp" id="add-link"
				class="nav-link text-black"><i
					class="fa-solid fa-user-plus me-3 item"></i>Add Employee</a></li>
			<li><a href="${contextRoot}/viewEmp/<%= users.getId() %>"
				class="nav-link text-black item" id="view-link"><i
					class="fa-solid fa-street-view me-3"></i>View Employees</a></li>

			<li><a href="${contextRoot}/logout"
				class="nav-link text-black item" id="view-link"><i
					class="fa-solid fa-power-off me-3"></i>Logout</a></li>

		</ul>
	</div>

	<!-- JavaScript for toggle functionality -->
	<script>
		function toggleSidebar() {
			const sidebar = document.getElementById("sidebar");
			sidebar.classList.toggle("open");
		}
	</script>

</body>
</html>
