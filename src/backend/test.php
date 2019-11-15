<?php
include 'connect.php';
$query = 'SELECT * FROM employee';
$result = mysql_query($query) or die('Query failed: ' . mysql_error());

while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
  printf("ID: %s  First Name: %s  Last Name: %s", $row["id"], $row["first_name"], $row['last_name']);
}
// Actually would assign data to php object, and json encode
mysql_free_result($result);

?>
