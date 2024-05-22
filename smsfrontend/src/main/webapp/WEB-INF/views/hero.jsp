<%@page import="com.smsb.entities.User"%>
<%
User user = (User) session.getAttribute("user");
%>


<div class="container  col-xxl-8 px-4 py-5">
	<div class="row flex-lg-row-reverse align-items-center g-5 py-5">
		<div class="col-10 col-sm-8 col-lg-6">
			<img src="${img}/hero.jpg" class="d-block  mx-lg-auto img-fluid"
				alt="Bootstrap Themes" width="700" height="500">
		</div>
		<div class="col-lg-6">
			<h1 class="display-5 fw-bold lh-1 mb-3">Employee Management
				System</h1>
			<p class="lead">Streamline Your Employee Management with Our
				Powerful System. Simplify Scheduling, Track Attendance, and Boost
				Productivity. Sign Up Today for a Free Trial!</p>
			<div class="d-grid gap-2 d-md-flex justify-content-md-start">
				<%
				if (user != null) {
				%>


				<a type="button" class="btn btn-outline-secondary btn-lg px-4"
					href="${contextRoot}/logout">Logout</a>

				<%
				} else {
				%>

				<button type="button" class="btn btn-primary btn-lg px-4 me-md-2">Sign
					up</button>
				<button type="button" class="btn btn-outline-secondary btn-lg px-4">Login</button>

				<%
				}
				%>
			</div>
		</div>
	</div>
</div>