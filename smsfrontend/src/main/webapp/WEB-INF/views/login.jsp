<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="./base.jsp"%>
</head>
<body>
	<%@include file="../../shared/navbar.jsp"%>

	<!-- Login 4 - Bootstrap Brain Component -->
	<section class="p-3 p-md-4 p-xl-5">
		<div class="container">
			<div class="card border-light-subtle shadow-sm">
				<div class="row g-0">
					<div class="col-12 col-md-6">
						<img class="img-fluid rounded-start w-100 h-100 object-fit-cover"
							loading="lazy" src="${img}/login.png" alt="BootstrapBrain Logo">
					</div>
					<div class="col-12 col-md-6">
						<div class="card-body p-3 p-md-4 p-xl-5">
							<div class="row">
								<div class="col-12">
									<div class="mb-5">
										<h3>Log in</h3>
									</div>
									<c:if test="${not empty sessionScope.msg}">
										<div class="alert text-center ${sessionScope.msg.cssClass}"
											role="alert">${sessionScope.msg.content}</div>
										<c:remove var="msg" scope="session" />
									</c:if>
								</div>
							</div>
							<form:form action="loggedin" method="post" modelAttribute="user">
								<div class="row gy-3 gy-md-4 overflow-hidden">
									<div class="col-12">
										<label for="email" class="form-label">Email <span
											class="text-danger">*</span></label> <input type="email"
											class="form-control" name="email" id="email"
											placeholder="name@example.com" />

									</div>
									<div class="col-12">
										<label for="password" class="form-label">Password <span
											class="text-danger">*</span></label> <input type="password"
											class="form-control " name="password" id="password" value="" />
									</div>
									<div class="col-12"></div>
									<div class="col-12">
										<div class="d-grid">
											<button class="btn bsb-btn-xl btn-primary" type="submit">Log
												in now</button>
										</div>
									</div>
								</div>
							</form:form>
							<div class="row">
								<div class="col-12">
									<hr class="mt-5 mb-4 border-secondary-subtle">
									<div
										class="d-flex gap-2 gap-md-4 flex-column flex-md-row justify-content-md-end">
										<a href="${contextRoot}/register"
											class="link-secondary text-decoration-none">Create new
											account</a>
									</div>
								</div>
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