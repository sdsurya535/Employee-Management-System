
<%@page import="com.smsb.entities.User"%>
<%
User us = (User) session.getAttribute("user");

if (us == null) {

	response.sendRedirect("login");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="./base.jsp"%>

</head>
<body>

	<%@include file="../../shared/navbar.jsp"%>

	<div class="d-flex">
		<%@include file="../../shared/sidebar.jsp"%>


		<div class="container">
			<div class="row">
				<div class="col-md-10 offset-1">
					<div class="mb-5 d-flex justify-content-center">
						<img class=" w-50 img-fluid" src="${img}/profile.png" alt="" />
					</div>
					<h1 class="text-center mb-5"><%=us.getFirstName()%>
						<%=us.getLastName()%></h1>
					<table class="table text-center table-striped">
						<tbody>
							<tr>
								<td>User ID</td>
								<td><span
									class="inline-flex rounded-sm bg-slate-200 px-2  font-semibold leading-5 text-md text-red-600">
										EMS<%=us.getId()%>
								</span></td>
							</tr>
							<tr>
								<td>User Name</td>
								<td><span
									class="text-green-700 font-bold text-lg uppercase"><%=us.getEmail()%></span></td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		
	$(document).ready(()=> {
		$('.item').removeClass('active');
		$('#profile-link').addClass('active');
		$('#profile-link').removeClass('text-black');
	})
	
	</script>


</body>


</html>