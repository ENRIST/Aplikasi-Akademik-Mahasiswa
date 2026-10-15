<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

require_once "koneksi.php";

$nim = $_GET['nim'] ?? '';

if (empty($nim)) {
    echo json_encode([
        "success" => false, 
        "message" => "NIM wajib diisi"
    ]);
    exit;
}

$query = "SELECT id, semester, ukt, pembayaran, status FROM status_mahasiswa WHERE nim = '$nim' ORDER BY id ASC";
$result = $koneksi->query($query);

$listStatus = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $listStatus[] = $row;
    }

    echo json_encode([
        "success" => true,
        "data" => $listStatus
    ]);
} else {
    echo json_encode([
        "success" => false, 
        "message" => "Data status tidak ditemukan untuk NIM tersebut"
    ]);
}
?>