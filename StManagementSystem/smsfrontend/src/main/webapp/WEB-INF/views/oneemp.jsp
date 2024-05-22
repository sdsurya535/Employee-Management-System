
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
					<c:choose>
						<c:when test="${empty employee}">
							<div class="text-center mt20">
								<img alt="no image" class="img-fluid" height="200px"
									width="200px" src="${img}/errors.png">
								<h1 class="mt-4  text-danger font-monstreatt">You Don't have
									the permission to access this Employee</h1>
							</div>
						</c:when>

						<c:otherwise>

							<div class="mb-5 d-flex justify-content-center">
								<img class=" mt-5 w-25 img-fluid" src="${img}/employee.png"
									alt="" />
							</div>

							<h1 class="text-center mb-5">${employee.name}</h1>
							<div class="table-responsive">
								<table class="table text-center table-striped">
									<tbody>
										<tr>
											<td>Employee ID</td>
											<td><span
												class="inline-flex rounded-sm bg-slate-200 px-2  font-semibold leading-5 text-md text-red-600">
													EMP${employee.eid} </span></td>
										</tr>
										<tr>
											<td>Employee Name</td>
											<td><span
												class="text-green-700 font-bold text-lg uppercase">${employee.name}</span></td>
										</tr>

										<tr>
											<td>Employee email</td>
											<td><span
												class="text-green-700 font-bold text-lg uppercase">${employee.email}</span></td>
										</tr>

										<tr>
											<td>Employee Job Title</td>
											<td><span
												class="text-green-700 font-bold text-lg uppercase">${employee.jobTitle}</span></td>
										</tr>

										<tr>
											<td>Employee Department</td>
											<td><span
												class="text-green-700 font-bold text-lg uppercase">${employee.department}</span></td>
										</tr>

										<tr>
											<td>Employee Mobile Number</td>
											<td><span
												class="text-green-700 font-bold text-lg uppercase">+91-${employee.phone}</span></td>
										</tr>

									</tbody>
								</table>
							</div>

							<div class="text-center container mt-5">
								<a href="${contextRoot}/updateEmp/${employee.eid}"
									class="btn btn-primary">Update</a>
								<button onclick="deleteContact(${employee.eid})"
									class="btn btn-danger">Delete</button>
							</div>

						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

	</div>





</body>


</html>