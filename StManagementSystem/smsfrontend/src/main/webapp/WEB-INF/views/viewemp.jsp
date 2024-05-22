
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://cdn.datatables.net/2.0.6/css/dataTables.dataTables.css" />
<%@include file="./base.jsp"%>


</head>
<body>

	<%@include file="../../shared/navbar.jsp"%>



	<div class="d-flex">

		<%@include file="../../shared/sidebar.jsp"%>

		<div class="container-fluid">

			<h1 class="pb-3 text-center mt-2">View Employees</h1>


			<div class="mt-5 table-responsive">

				<table id="example" class="table table-striped" style="width: 100%">
					<thead class="text-center table-dark">
						<tr>
							<th>Employee ID</th>
							<th>Name</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Job Title</th>
							<th>Department</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="emp" items="${emp}">
							<tr>
								<td><a class="text-decoration-none text-black"
									href="${contextRoot}/oneemp/${emp.eid}">EMP${emp.eid}</a></td>
								<td><a href="${contextRoot}/oneemp/${emp.eid}"
									class="text-decoration-none text-black">${emp.name }</a></td>
								<td><a href="${contextRoot}/oneemp/${emp.eid}"
									class="text-decoration-none text-black">${emp.email }</a></td>
								<td><a href="${contextRoot}/oneemp/${emp.eid}"
									class="text-decoration-none text-black">+91-${emp.phone }</a></td>
								<td><a href="${contextRoot}/oneemp/${emp.eid}"
									class="text-decoration-none text-black">${emp.jobTitle }</a></td>
								<td><a href="${contextRoot}/oneemp/${emp.eid}"
									class="text-decoration-none text-black">${emp.department}</a></td>
								<td><button type="button"
										onclick="deleteContact(${emp.eid})"
										class="btn btn-danger btn-sm me-1" data-bs-toggle="tooltip"
										data-bs-placement="top" data-bs-title="Delete">
										<i class="fa-solid fa-trash"></i>
									</button> <a href="${contextRoot}/updateEmp/${emp.eid}" type="button"
									class="btn btn-warning btn-sm" data-bs-toggle="tooltip"
									data-bs-placement="top" data-bs-title="Update"><i
										class="fa-solid fa-pen-nib"></i></a></td>

							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>



	</div>

	<script type="text/javascript">
	
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
	
	
	
	</script>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
	<script
		src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>

	<script type="text/javascript">
	$(document).ready(function() {
	    $('#example').DataTable({
	        responsive: true
	    });
	});
	</script>



	<script type="text/javascript">
		
	$(document).ready(()=> {
		$('.item').removeClass('active');
		$('#view-link').addClass('active');
		$('#view-link').removeClass('text-black');
	
	})
	
	</script>



</body>


</html>