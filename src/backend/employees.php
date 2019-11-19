<?php
	include 'connect.php';
	function getTableJson($tableName) {
		$link = connect(HOST, USERNAME, PASSWORD, DATABASE);
		$query = 'SELECT * FROM ' . $tableName;
		$result = mysql_query($query) or die('Query failed: ' . mysql_error());
		$data = array();
		while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
			$data[] = $row;
		}
		mysql_free_result($result);
		mysql_close($link);
		$tableJson = array("table_name" => $tableName, "data" => $data);
		return json_encode($tableJson);
	}

	print getTableJson('employee');
?>
