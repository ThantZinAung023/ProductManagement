<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<!-- <script type="text/javascript"> -->

<script>
	$(document).ready(function() {
		$('.register-link').click(function() {
			$('.wrapper').addClass('form-active');
		})

		$('.login-link').click(function() {
			$('.wrapper').removeClass('form-active');
		})

		$('.btn-popup').click(function() {
			$('.wrapper').addClass('active-popup');
		})

		$('.icon-close').click(function() {
			$('.wrapper').removeClass('active-popup');
		})

	})
</script>