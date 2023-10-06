<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	position: relative;
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: center;
	min-height: 100vh;
	background-image: url(https://shorturl.at/bfxPY);
	background-size: cover;
	background-position: center;
}

body::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(35, 101, 150, .5);
}

.wrapper {
	margin-top: 20px;
	position: relative;
	z-index: 99;
	backdrop-filter: blur(10px);
	background: transparent;
	width: 350px;
	height: 500px;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #1a1110;
	border: 1px solid #918e8e;
	overflow: hidden;
	transition: height .2s ease;
	transform: scale(0);
}
.modal-backdrop.show {
margin-top:auto;
z-index: 2;
}
.modal-dialog{
margin-top:200px;
}
.modalBtn{
width:150px;
display: inline;
}
.btnGp{
display: flex;
justify-content: flex-end;
}

.registerMsg {
	border-radius: 5px;
	margin-top: 100px;
	font-size: 18px;
	font-weight: 600;
}

.form-active {
	height: 720px;
}

.active-popup {
	transform: scale(1);
}

.wrapper .register-box {
	position: absolute;
	transition: none;
	transform: translateX(400px);
}

.wrapper.form-active .register-box {
	transition: transform .18s ease;
	transform: translateX(0);
}

.wrapper .login-box {
	transition: transform .18s ease;
	transform: translateX(0);
}

.wrapper.form-active .login-box {
	transition: none;
	transform: translateX(-400px);
}

.wrapper .container {
	width: 100%;
	padding: 10px 40px;
}

.wrapper .icon-close {
	position: absolute;
	top: 0;
	right: 0;
	width: 45px;
	height: 45px;
	display: flex;
	justify-content: center;
	text-align: center;
	font-size: 2em;
	color: #fff;
	border-bottom-left-radius: 20px;
	cursor: pointer;
	z-index: 99;
}

.wrapper .icon-close:hover {
	background-color: red !important;
}

.input-box {
	position: relative;
	width: 100%;
	margin: 30px 0;
	border-bottom: 2px solid whitesmoke;
}

.input-box input {
	background: transparent;
	width: 100%;
	height: 100%;
	border: none;
	outline: none;
	font-size: 1em;
	font-weight: 600;
	color: #1a1110;
}

.container-fluid .navbar-brand {
	color: #fff;
	font-size: 25px;
	font-weight: bolder;
	letter-spacing: 2.5px;
}

.navbar-nav a {
	font-size: 18px;
	position: relative;
	margin-right: 40px;
	color: whitesmoke;
	font-weight: 500;
}

.navbar-nav a::after {
	content: '';
	position: absolute;
	left: 0;
	bottom: 0;
	background: whitesmoke;
	width: 100%;
	height: 3px;
	border-radius: 5px;
	transform: scaleX(0);
	transition: transform .5s;
	transform-origin: left;
}

.navbar-nav a:hover::after {
	transform: scaleX(1);
	transform-origin: right;
}

.navbar-nav button {
	font-size: 20px;
}

button#logout {
	margin: 0px;
	padding: 6px 6px;
	font-size: 20px;
	font-weight: 600;
}

.form-check-input:checked {
	background-color: #1a1110;
	border-color: #1a1110;
}

.wrapper .btn {
	width: 100%;
	margin-bottom: 20px;
}

.login-register p a {
	text-decoration: none;
	color: #1a1110;
	font-weight: 500;
}

.login-register p a:hover {
	text-decoration: underline;
}

/* home */
#home .home-wrapper {
	position: relative;
	color: #fff;
	padding: 50px;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

#home .home-wrapper h2 {
	display: flex;
	justify-content: center;
	color: lightgreen;
	font-weight: 600;
}

#home .home-wrapper h1 {
	color: yellow;
	font-weight: bolder;
}
</style>