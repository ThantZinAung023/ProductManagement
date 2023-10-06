<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User</title>
<%@ include file="css.jsp"%>
</head>

<body>
	<%@ page import="java.util.List , com.ai.jwd42.dto.User"%>
	<%@ include file="menu.jsp"%>

	<div class="container" style="z-index: 99;">


		<div
			style="width: 50%; margin: auto; display: flex; justify-content: space-between; align-items: center; color: yellow;">
			<h1>
				<u>User LIST</u>
			</h1>

		</div>
		<div>
			<h3 style="width: 70%; margin: auto; color:aqua ;">
					<%
 					String message = (String) session.getAttribute("message");
 						if (message != null) {
 						out.print(message);
 						session.removeAttribute("message");
 						}
 					%>
 			</h3>
		</div>
		<div class=" mx-5 px-5 mt-4 d-flex  justify-content-center ">

			<table class="data-table table table-striped">
				<thead class="mb-2">
					<tr>
						<th scope="col">No.</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Phone Number</th>
						<th scope="col">Update</th>
						<th scope="col">Delete</th>
						<th scope="col">Change</th>
					</tr>
				</thead>

				<tbody>
					<%
					List<User> users = (List<User>) request.getAttribute("users");
					int i = 1;
					for (User user : users) {
						String modalUpdateId = "modalUpdate" + user.getId();
						String modalDeleteId = "modalDelete" + user.getId();
					%>
					<tr>
						<th scope="row"><%=i++%></th>
						<td><%=user.getName()%></td>
						<td><%=user.getEmail()%></td>
						<td><%=user.getPhoneNumber()%></td>
						<td><input type="button" class="btn btn-outline-primary"
							onclick="openUpdateModal('<%=user.getId()%>' , '<%=user.getName()%>' , '<%=user.getEmail()%>' , '<%=user.getPhoneNumber()%>')"
							value="Update" /></td>

						<td><input type="button" class="btn btn-outline-primary"
							onclick="openDeleteModal('<%=user.getId()%>' , '<%=user.getName()%>')"
							value="Delete" /></td>

						<td><input type="button" class="btn btn-outline-primary"
							onclick="openChangePasswordModal('<%=user.getId()%>')"
							value="Change Password" /></td>
					</tr>
					<%
					}
					%>

				</tbody>
			</table>
		</div>


		<!-- Update Modal -->
		<div class="modal fade" id="updateModel">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 align="center" class="modal-title fs-5 fw-3"
							id="staticBackdropLabel">Update User</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form:form action="/ProductManagementProject/updateUser" method="post">
						<div class="mb-3">
							<form:label path="name" class="form-label text-success">Username</form:label>
							<form:input path="name" id="updateName" class="form-control" />
						</div>
						<div class="mb-3">
							<form:label path="email" class="form-label text-success">Email</form:label>
							<form:input path="email" id="updateEmail" class="form-control" />
						</div>
						<div class="mb-3">
							<form:label path="phoneNumber" class="form-label text-success">PhoneNumber</form:label>
							<form:input path="phoneNumber" id="updatePhoneNumber" class="form-control" />
						</div>
						<hr>
						<div class="btnGp">
							<form:hidden path="id" id="updateId" />
							<input type="reset" class="modalBtn btn btn-outline-danger" value="Reset"> 
							<input type="submit" class="modalBtn btn btn-success col-2" value="Update">
						</div>
					</form:form>
				</div>
			</div>
		</div>

		<!--Delete Modal -->
		<div class="modal fade" id="deleteModal" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 align="center" class="modal-title fs-5"
							id="staticBackdropLabel">Delete User</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<h3>
							<span class="d-block">Are you sure want to delete</span> 
							"<big class="text-warning " id="deleteName"></big>" !
						</h3>
					</div>
					<hr>
					<form:form action="/ProductManagementProject/deleteUser" method="post">
						<div class="btnGp">
							<input type="button" class="modalBtn btn btn-outline-primary"
								data-bs-dismiss="modal" value="No">
							<form:hidden path="id" id="deleteId" />
							<input type="submit" class="modalBtn btn btn-danger col-2"
								value="Yes">
						</div>
					</form:form>
				</div>
			</div>
		</div>

		<!--Change Password Modal -->
		<div class="modal fade" id="changeModal">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 align="center" class="modal-title fs-5 fw-3"
							id="staticBackdropLabel">Change Password</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form:form action="/ProductManagementProject/changeUser" method="post">
						<div class="mb-3">
							<form:label path="password" class="form-label text-success">Old Password</form:label>
							<form:password path="password" class="form-control" placeholder="Enter Old Password" />
						</div>
						<div class="mb-3">
							<form:label path="newPassword" class="form-label text-success">New Password</form:label>
							<form:password path="newPassword" class="form-control" placeholder="Enter New Password"/>
						</div>
						<div class="mb-3">
							<form:label path="comfirmPassword" class="form-label text-success">Comfirm Password</form:label>
							<form:password path="comfirmPassword" class="form-control" placeholder="Enter Comfirm Password"/>
						</div>
						<hr>
						<div class="btnGp">
							<input type="reset" class="modalBtn btn btn-outline-danger" value="Reset">
							<form:hidden path="id" id="changePasswordId"/>
							<input type="submit" class="modalBtn btn btn-success col-2" value="Change">
						</div>

					</form:form>
				</div>
			</div>
		</div>

	</div>

</body>

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>

<script>
	function openChangePasswordModal(id) {
		$('#changePasswordId').val(id);
		$('#changeModal').modal('show');
	};
	function openUpdateModal(id, name, email, phoneNumber) {
		$('#updateId').val(id);
		$('#updateName').val(name);
		$('#updateEmail').val(email);
		$('#updatePhoneNumber').val(phoneNumber);
		$('#updateModel').modal('show');
	};
	function openDeleteModal(id, name) {
		$('#deleteId').val(id);
		$('#deleteName').text(name);
		$('#deleteModal').modal('show');
	};
</script>

</html>

