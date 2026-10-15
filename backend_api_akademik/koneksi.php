<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "db_akademik";

$koneksi = new mysqli($host, $user, $pass, $db);

if ($koneksi->connect_error) {
    die(json_encode([
        "success" => false,
        "message" => "Koneksi gagal: " . $koneksi->connect_error
    ]));
}
?>