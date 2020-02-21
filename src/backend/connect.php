<?php
  header("Access-Control-Allow-Origin: https://bookstore.harrisonhaigler.com");
  define(HOST,  "");
  define(USERNAME,  "");
  define(PASSWORD,  "");
  define(DATABASE,  "");

  function connect($host, $username, $password, $database) {
    $link = mysql_connect($host, $username, $password)
      or die('Could not connect: ' . mysql_error());
    mysql_select_db($database) or die('Could not connect to database');
    return $link;
  }
?>
