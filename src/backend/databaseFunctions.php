<?php
	include 'connect.php';
	function getTableArray($tableName) {
		$link = connect(HOST, USERNAME, PASSWORD, DATABASE);
		$query = 'SELECT * FROM ' . $tableName;
		$result = mysql_query($query) or die('Query failed: ' . mysql_error());
		$data = getDataArray($result);
		mysql_close($link);
		$tableArray = array("table_name" => $tableName, "data" => $data);
		return $tableArray;
	}

	function executeQuery($query) {
		$link = connect(HOST, USERNAME, PASSWORD, DATABASE);
		$result = mysql_query($query);
		$queryLower = strtolower($query);
		if (!$result) {
			$output = "Query failed: " . mysql_error();
			header('HTTP/1.1 422 Unprocessable Entity');
		}
		else if (is_bool($result)) {
			$output = "Query successful! Database has been updated accordingly!";
			header('HTTP/1.1 205 Reset Content');
		}
		else {
			$data = getDataArray($result);
			$tableArray = array("table_name" => "result", "data" => $data);
			$output = json_encode($tableArray);
		}
		mysql_close($link);
		return $output;
	}

	function getDataArray($result) {
		$data = array();
		while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
			$data[] = $row;
		}
		mysql_free_result($result);
		return $data;
	}
?>
