<% String currentPath=request.getServletPath(); %>
<div>
	<nav class="navbar navbar-expand-lg fixed-top p-3">
		<div class="container-fluid d-flex justify-content-around">
			<a class="navbar-brand" href="#">Logo</a>
			<div style="color:white;">login date time is <% out.print(request.getSession().getAttribute("loginDateTime")); %></div>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div>
				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<div class="navbar-nav">
						<a class="nav-link <%= currentPath.equals("/home")?"active":"" %>" aria-current="page" href="home">Home</a> 
						<a class="nav-link <%= currentPath.equals("/user")?"active":"" %>" href="user">User Management</a> 
						<a class="nav-link <%= currentPath.equals("/product")?"active":"" %>" href="product">Product Management</a> 
						<a class="nav-link <%= currentPath.equals("/printer")?"active":"" %>" href="printer">Printer Management</a>
						
					</div>
					<form action="logout">
						<button id="logout" type="submit" class="btn btn-popup btn-outline-dark px-4 ms-3">Logout</button>
					</form>
				</div>
			</div>
		</div>
	</nav>

</div>