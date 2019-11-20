<?php	
	include 'databaseFunctions.php';
	$query = stripslashes($_GET['query']);
	print executeQuery($query);
?>

