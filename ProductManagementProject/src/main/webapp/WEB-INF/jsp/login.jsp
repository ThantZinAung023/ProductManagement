<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<%@ include file="css.jsp"%>
</head>

<body>
	<%@ include file="loginMenu.jsp"%>



	<!-- Form -->

	<span class="registerMsg text-warning bg-light p-1"><%
 				String message = (String) session.getAttribute("registerMessage");
 				if (message != null) {
 					out.print(message);
 					session.removeAttribute("registerMessage");
 				}
 				%></span>

	<main class="wrapper active-popup">
		<div id="icon">
			<span class="icon-close bg-secondary"><i class="bi bi-x"></i></span>
		</div>

		<!--  login Form-->
		<div class="container login-box">

			<form:form action="/ProductManagementProject/login" method="post">
				<h3 align="center">Login Here</h3>
				<h3 align="center" class="text-success">
					<%
					if (request.getSession().getAttribute("message") != null) {
						out.print(request.getSession().getAttribute("message"));
						session.removeAttribute("message");
						if (request.getAttribute("back") != null) {
							out.print(request.getAttribute("back"));
						}
					}
					%>
				</h3>

				<hr>
				<div class="mb-3 input-box">
					<form:label path="email">Email</form:label>
					<form:input path="email" />
				</div>
				<div class="mb-3 input-box">
					<form:label path="password">Password</form:label>
					<form:password path="password" />
				</div>
				<div class="mb-3 form-check">
					<form:checkbox path="rememberMe" class="form-check-input"/>
					<form:label path="rememberMe" class="form-check-label">Remember Me?</form:label>
				</div>
				<span class="text-danger"> 
				<%
 				String error = (String) session.getAttribute("error");
 				if (error != null) {
 					out.print(error);
 					session.removeAttribute("error");
 				}
 				%>
				</span>
				<form:hidden path="loginDateTime" />
				<button type="submit" class="btn btn-secondary">Login</button>
				<div class="login-register">
					<p>
						Don't have a account? <a href="#" class="register-link">Register
							here</a>
					</p>
				</div>
			</form:form>
		</div>

		<!-- register Form-->
		<div class="container register-box ">

			<form:form action="/ProductManagementProject/addUser" method="post">
				<h3 align="center">Register Here</h3>
				<span class="text-danger f-1">
				<%
 				if (message != null) {
 					out.print(message);
 					session.removeAttribute("registerMessage");
 				}
 				%>
 				</span>
				<hr>
				<div class=" input-box">
					<form:label path="name" >Username</form:label>
					<form:input path="name" placeholder="Username" />
				</div>
				<div class=" input-box">
					<form:label path="email">Email</form:label>
					<form:input path="email" placeholder="Email" />
				</div>
				<div class=" input-box">
					<form:label path="phoneNumber">Phone Number</form:label>
					<form:input path="phoneNumber" placeholder="Phonenumber"  />
				</div>
				<div class=" input-box">
					<form:label path="password">Password</form:label>
					<form:password path="password" placeholder="Password" />
				</div>
				<div class=" input-box">
					<form:label path="comfirmPassword">Password</form:label>
					<form:password path="comfirmPassword"
						placeholder="Comfirm Password"  />
				</div>
				<div class=" form-check">
					<input type="checkbox" class="form-check-input" id="Check"
						name="agree" required> <label class="form-check-label" for="Check">I
						agree to the trems & conditions</label>
				</div>
				<button type="submit" class="btn btn-secondary">Register</button>
				<div class="login-register">
					<p>
						Already have a account? <a href="#" class="login-link">Login
							here</a>
					</p>
				</div>
			</form:form>
		</div>
	</main>










	<%@ include file="jquery.jsp"%>


</body>

</html>