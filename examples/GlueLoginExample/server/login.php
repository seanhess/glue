<?php
	
	// Gives a JSON response if you send "bob" and "bob" as the user/password
	// Also stores something in the session just so we can have a fake logout script too


	session_start();
	
	if ($_GET['username'] == "bob" && $_GET['password'] == "bob")
	{
		echo "{'authenticated':true, 'email':'bob@bob.com'}";
		$_SESSION['authenticated'] = true;
	}
	
	else
		echo "{'authenticated':false}";
?>