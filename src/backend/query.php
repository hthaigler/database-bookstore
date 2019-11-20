<?php	
	include 'databaseFunctions.php';
	$query = $_GET['query'];
	print executeQuery($query);
?>

