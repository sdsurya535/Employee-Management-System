
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

			<section class="p-3 p-md-4 p-xl-5">
				<div class="container">
					<div class="row">
						<div class="col-12 col-md-6 bsb-tpl-bg-platinum">
							<div
								class="d-flex flex-column justify-content-between h-100 p-3 p-md-4 p-xl-5">
								<h3 class="m-0">Voilaa!</h3>
								<img class="img-fluid rounded mx-auto my-4"
									src="${img}/emp.jpg" width="500" height="80"
									alt="BootstrapBrain Logo">
							</div>
						</div>
						<div class="col-12 col-md-6 bsb-tpl-bg-lotion">
							<div class="p-3 p-md-4 p-xl-5">
								<div class="row">
									<div class="col-12">
										<div class="mb-5">
											<h2 class="h3">ADD EMPLOYEE</h2>

											<c:if test="${not empty sessionScope.msg}">
												<div class="alert text-center ${sessionScope.msg.cssClass}"
													role="alert">${sessionScope.msg.content}</div>
												<c:remove var="msg" scope="session" />
											</c:if>



											<h3 class="fs-6 fw-normal text-secondary m-0">Add your
												employees</h3>
										</div>
									</div>
								</div>
								<form:form action="addedemp" method="post"
									modelAttribute="employee">

									<div class="row gy-3 gy-md-4 overflow-hidden">
										<div class="col-12">
											<label for="name" class="form-label">Employee Name </label> <input
												type="text" class="form-control ${nameClass} " name="name"
												id="firstName" placeholder=" Name" />
											<div class="invalid-feedback">
												<form:errors path="name" element="span" />
											</div>

										</div>
										<div class="col-12">
											<label for="email" class="form-label">Employee Email</label>
											<input type="email" class="form-control ${emailClass }"
												name="email" id="email" placeholder="name@example.com">
											<div class="invalid-feedback">
												<form:errors path="email" element="span" />
											</div>

										</div>
										<div class="col-12">
											<label for="phone" class="form-label">Mobile Number </label>
											<input type="text" class="form-control ${phoneClass} "
												name="phone" id="phone" placeholder=" mobile number" />
											<div class="invalid-feedback">
												<form:errors path="phone" element="span" />
											</div>

										</div>
										<div class="col-12">
											<label for="jobTitle" class="form-label">Employee Job
												Title </label> <input type="text" class="form-control ${jobClass} "
												name="jobTitle" id="firstName" placeholder=" job title" />
											<div class="invalid-feedback">
												<form:errors path="jobTitle" element="span" />
											</div>

										</div>
										<div class="col-12">
											<label for="jobTitle" class="form-label">Employee
												Department </label> <input type="text"
												class="form-control ${departmentClass}" name="department"
												id="deparatment" placeholder=" department" />
											<div class="invalid-feedback">
												<form:errors path="department" element="span" />
											</div>

										</div>
										<div class="col-12"></div>
										<div class="col-12">
											<div class="d-grid">
												<button class="btn bsb-btn-xl btn-primary" type="submit">Add
													Employee</button>
											</div>
										</div>
									</div>
								</form:form>


							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

	</div>



	<script type="text/javascript">
		
	$(document).ready(()=> {
		$('.item').removeClass('active');
		$('#add-link').addClass('active');
		$('#add-link').removeClass('text-black');
		
	})
	
	</script>
</body>


</html>