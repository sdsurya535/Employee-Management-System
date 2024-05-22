
<%@page import="com.smsb.entities.User"%>
<%
User u = (User) session.getAttribute("user");
%>

<nav class="navbar navbar-expand-lg bg-hero">
	<div class="container-fluid">
		<a class="navbar-brand fs-4 text-white fw-medimum text-uppercase"
			href="#">Employee Management System</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<%
				if (u != null) {
				%>


				<li class="nav-item d-none menu"><a class="nav-link text-white"
					href="${contextRoot}/dashboard">Profile</a></li>
				<li class="nav-item d-none menu"><a class="nav-link text-white"
					href="${contextRoot}/addEmp">Add Employee</a></li>
				<li class="nav-item d-none menu"><a class="nav-link text-white"
					href="${contextRoot}/viewEmp/<%= u.getId() %>">View Employee</a>
				<li class="nav-item"><a class="nav-link active text-white"
					aria-current="page" href="${contextRoot}/dashboard"><i
						class="fa-solid fa-circle-user me-1"></i><%=u.getFirstName()%> <%=u.getLastName()%></a></li>
				<li class="nav-item"><a class="nav-link text-white"
					href="${contextRoot}/logout"><i
						class="fa-solid fa-power-off me-1"></i>Logout</a></li>


				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link active text-white"
					aria-current="page" href="${contextRoot}/">Home</a></li>
				<li class="nav-item"><a class="nav-link text-white"
					href="${contextRoot}/about">About</a></li>
				<li class="nav-item"><a class="nav-link text-white"
					href="${contextRoot}/contact">Contact Us</a></li>

				<li class="nav-item"><a class="nav-link text-white"
					href="${contextRoot}/register">Signup</a></li>

				<li class="nav-item"><a class="nav-link text-white"
					href="${contextRoot}/login">Login</a></li>


				<%
				}
				%>
			</ul>
		</div>
	</div>

	<script>
		$(document).ready(function() {

			var currentPage = window.location.pathname;

			$('nav div ul a').each(function() {
				var link = $(this).attr('href');

				if (currentPage === link) {
					$(this).addClass('fw-bold');
				}
			});
		});
	</script>
</nav>