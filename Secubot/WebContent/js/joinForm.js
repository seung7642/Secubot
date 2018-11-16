$(document).ready(function() {
	var $password = $('#password');
	var $btnSubmit = $('#btnSubmit');
	
	$btnSubmit.on('click', function() {
		var password = $password.val();
		
		if (!passwordCheck(password)) {
			$('#passwordError').text("*Invalid Password.");
			$password.focus();
			return false;
		} else {
			$('#passwordError').text("");
			return true;
		}
	});
});

function passwordCheck(password) {
	var regExp = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	return regExp.test(password);
}