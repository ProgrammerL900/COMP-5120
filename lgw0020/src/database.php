<?php

$dbhost = "sysmysql8.auburn.edu";
$dbuser = "lgw0020";
$dbpass = "DataBase9@ssW0rd";
$dbname = "lgw0020db";

$tables = array("db_book", "db_customer", "db_order_detail", "db_employee", "db_order", "db_shipper", "db_subject", "db_supplier");

function get_connection()
{
    global $dbhost, $dbuser, $dbpass, $dbname;
    $connection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
    if ($connection === false) {
        die("Could not connect: " . mysqli_connect_error($connection));
    }
    return $connection;
}

function execute_query($connection, $query)
{
    return mysqli_query($connection, $query);
}

function count_rows($connection)
{
    return mysqli_affected_rows($connection);
}

function get_error($connection)
{
    return mysqli_error($connection);
}

?>