<?php  
	include 'databaseFunctions.php';
	$tableNames = array(
		"employees", 
		"customers",
		"shippers",
		"suppliers",
		"subjects",
		"books",
		"orders",
		"order_details"
	);
	$tableJsons = array();
	foreach($tableNames as $tableName) {
		$tableJsons[] = getTableArray($tableName);
	}
	print json_encode($tableJsons);
?>