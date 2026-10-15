<?php
header("Content-Type: application/json");
require_once "koneksi.php";

$query = "SELECT * FROM jadwal ORDER BY hari, jam ASC";
$result = $koneksi->query($query);

$jadwalList = [];
if ($result) {
    while ($row = $result->fetch_assoc()) {
        $jadwalList[] = $row;
    }
}

echo json_encode([
    "success" => true,
    "data" => $jadwalList
]);
?>