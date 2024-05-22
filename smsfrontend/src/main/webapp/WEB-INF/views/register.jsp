<!DOCTYPE html>
<%@page import="com.smsb.helper.Message"%>
<html lang="en">
<head>
<%@include file="./base.jsp"%>

</head>
<body>
	<%@include file="../../shared/navbar.jsp"%>

	<!-- Registration -  Component -->
	<section class="p-3 p-md-4 p-xl-5">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-6 bsb-tpl-bg-platinum">
					<div
						class="d-flex flex-column justify-content-between h-100 p-3 p-md-4 p-xl-5">
						<h3 class="m-0">Welcome!</h3>
						<img class="img-fluid rounded mx-auto my-4" loading="lazy"
							src="${img}/register.png" width="500" height="80"
							alt="BootstrapBrain Logo">
						<p class="mb-0">
							Not a member yet? <a href="#!"
								class="link-secondary text-decoration-none">Register now</a>
						</p>
					</div>
				</div>
				<div class="col-12 col-md-6 bsb-tpl-bg-lotion">
					<div class="p-3 p-md-4 p-xl-5">
						<div class="row">
							<div class="col-12">
								<div class="mb-5">
									<h2 class="h3">Registration</h2>

									<c:if test="${not empty sessionScope.msg}">
										<div class="alert text-center ${sessionScope.msg.cssClass}"
											role="alert">${sessionScope.msg.content}</div>
										<c:remove var="msg" scope="session" />
									</c:if>



									<h3 class="fs-6 fw-normal text-secondary m-0">Enter your
										details to register</h3>
								</div>
							</div>
						</div>
						<form:form action="registered" method="post" modelAttribute="user">

							<div class="row gy-3 gy-md-4 overflow-hidden">
								<div class="col-12">
									<label for="firstName" class="form-label">First Name <span
										class="text-danger">*</span></label>
									<form:input type="text" path="firstName"
										class="form-control ${firstNameClass}" name="firstName"
										id="firstName" placeholder="First Name" />
									<div class="invalid-feedback">
										<form:errors path="firstName" element="span" />
									</div>
								</div>
								<div class="col-12">
									<label for="lastName" class="form-label">Last Name <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control ${lastNameClass}" name="lastName"
										id="lastName" placeholder="Last Name">
									<div class="invalid-feedback">
										<form:errors path="lastName" element="span" />
									</div>
								</div>
								<div class="col-12">
									<label for="email" class="form-label">Email <span
										class="text-danger">*</span></label> <input type="email"
										class="form-control ${emailClass}" name="email" id="email"
										placeholder="name@example.com">
									<div class="invalid-feedback">
										<form:errors path="email" element="span" />
									</div>
								</div>
								<div class="col-12">
									<label for="password" class="form-label">Password <span
										class="text-danger">*</span></label> <input type="password"
										class="form-control ${passwordClass}" name="password"
										id="password" value="">
									<div class="invalid-feedback">
										<form:errors path="password" element="span" />
									</div>
								</div>
								<div class="col-12">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											name="iAgree" id="iAgree" required="required"> <label
											class="form-check-label text-secondary" for="iAgree">
											I agree to the <a href="#!"
											class="link-primary text-decoration-none">terms and
												conditions</a>
										</label>
									</div>
								</div>
								<div class="col-12">
									<div class="d-grid">
										<button class="btn bsb-btn-xl btn-primary" type="submit">Sign
											up</button>
									</div>
								</div>
							</div>
						</form:form>
						<div class="row">
							<div class="col-12">
								<hr class="mt-5 mb-4 border-secondary-subtle">
								<p class="m-0 text-secondary text-end">
									Already have an account? <a href="${contextRoot}/login"
										class="link-primary text-decoration-none">Sign in</a>
								</p>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>