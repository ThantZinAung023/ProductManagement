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
	<%@ page import="java.util.List , com.ai.jwd42.dto.*"%>
	<%@ include file="menu.jsp"%>

	<div class="container" style="z-index: 99;">


		<div
			style="width: 50%; margin: auto; display: flex; justify-content: space-between; align-items: center; color: yellow; margin-top: 100px;">
			<h1>
				<u>Printer LIST</u>
			</h1>

			<input type="button" class="btn btn-outline-secondary"
				onclick="openAddModal()" value="ADD New Printer" />

		</div>
		<div>
			<h3 style="width: 50%; margin: auto; color: yellow;">
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
						<th scope="col">NO.</th>
						<th scope="col">Color</th>
						<th scope="col">Make</th>
						<th scope="col">Model</th>
						<th scope="col">Price</th>
						<th scope="col">Update</th>
						<th scope="col">Delete</th>

					</tr>
				</thead>

				<tbody>
					<%
					List<Printer> printers = (List<Printer>) request.getAttribute("printers");
					int i = 1;
					for (Printer printer : printers) {
					%>
					<tr>
						<th scope="row"><%=i++%></th>
						<td><%=printer.getColor()%></td>
						<td><%=printer.getMake()%></td>
						<td><%=printer.getModel()%></td>
						<td><%=printer.getPrice()%></td>
						<td><input type="button" class="btn btn-outline-primary"
							onclick="openUpdateModal('<%=printer.getId()%>' , '<%=printer.getColor()%>' ,'<%=printer.getModel()%>' , '<%=printer.getProduct_id()%>' , '<%=printer.getPrice()%>' )"
							value="Update" /></td>

						<td><input type="button" class="btn btn-outline-primary"
							onclick="openDeleteModal('<%=printer.getId()%>' , '<%=printer.getModel()%>')"
							value="Delete" /></td>

					</tr>
					<%
					}
					%>

				</tbody>
			</table>
		</div>
		
		<!-- Add Modal -->
		<div class="modal fade" id="addModal">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 align="center" class="modal-title fs-5 fw-3"
							id="staticBackdropLabel">Add New Product</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form:form action="/ProductManagementProject/addPrinter" method="post">
						<div class="mb-3">
							<form:label path="color" class="form-label text-success">Color</form:label>
							<form:input path="color" class="form-control" placeholder="Enter Model"/>
						</div>
						<div class="mb-3 w-100">
							<form:label path="product_id" class="form-label text-success">Model</form:label>
							<form:select path="product_id" class="form-select">
								<form:option value="NONE" label="Select"/>
								<form:options items="${productList}" /> 
							</form:select>
						</div>
						<div class="mb-3">
							<form:label path="price" class="form-label text-success">Price</form:label>
							<form:input path="price" class="form-control" placeholder="Enter Price" />
						</div>
						<hr>
						<div class="btnGp">
							<form:hidden path="id" id="addId" />
							<input type="reset" class="modalBtn btn btn-outline-danger" value="Reset">
							<input type="submit" class="modalBtn btn btn-success col-2" value="Add Printer">
						</div>
					</form:form>
				</div>
			</div>
		</div>
		
		<!-- Update Modal -->
		<div class="modal fade" id="updateModal">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 align="center" class="modal-title fs-5 fw-3"
							id="staticBackdropLabel">Update Product Data</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form:form action="/ProductManagementProject/updatePrinter" method="post">
						<div class="mb-3">
							<form:label path="color" class="form-label text-success">Color</form:label>
							<form:input path="color" class="form-control" id="updateColor"/>
						</div>
						<div class="mb-3 w-100">
							<form:label path="product_id" class="form-label text-success">Model</form:label>
							<form:select path="product_id" class="form-select">
								<form:option value="" id="updateProductId"/>
								<form:options items="${productList}" /> 
							</form:select>
						</div>
						<div class="mb-3">
							<form:label path="price" class="form-label text-success">Price</form:label>
							<form:input path="price" class="form-control" id="updatePrice" />
						</div>
						<hr>
						<div class="btnGp">
							<form:hidden path="id" id="updateId" />
							<input type="button" class="modalBtn btn btn-outline-primary" data-bs-dismiss="modal" value="Cancel">
							<input type="submit" class="modalBtn btn btn-success col-2" value="Update">
						</div>
					</form:form>
				</div>
			</div>
		</div>
		
		<!--Delete Modal -->
		<div class="modal fade" id="deleteModal"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
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
							<span class="d-block">Are you sure want to delete</span> "<big class="text-warning " id="deleteName" ></big>" ?
						</h3>

					</div>
					<hr>
					<form:form action="/ProductManagementProject/deletePrinter" method="post">
						<div class="btnGp">
							<form:hidden path="id" id="deleteId" />
							<input type="button" class="modalBtn btn btn-outline-primary" data-bs-dismiss="modal" value="No"> 
							<input type="submit" class="modalBtn btn btn-danger col-2" value="Yes">
						</div>
					</form:form>
				</div>
			</div>
		</div>
		

	</div>

	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>

	<script>
		function openAddModal() {
			$('#addModal').modal('show');
		};
		function openUpdateModal(id, color, model, productId, price) {
			$('#updateId').val(id);
			$('#updateColor').val(color);
			$('#updateProductId').val(productId);
			$('#updateProductId').text(model);
			$('#updatePrice').val(price);
			$('#updateModal').modal('show');
		};
		function openDeleteModal(id, model) {
			$('#deleteId').val(id);
			$('#deleteName').text(model);
			$('#deleteModal').modal('show');
		};
	</script>

</body>

</html>

