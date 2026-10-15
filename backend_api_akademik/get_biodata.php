<?php
header("Content-Type: application/json");
require_once "koneksi.php";

$nim = $_GET['nim'] ?? '';

if (empty($nim)) {
    echo json_encode(["success" => false, "message" => "NIM wajib disertakan"]);
    exit;
}

$query = "SELECT nim, nama, prodi, jenis_kelamin, tempat_lahir, tanggal_lahir, email FROM mahasiswa WHERE nim = '$nim'";
$result = $koneksi->query($query);

if ($result && $result->num_rows > 0) {
    echo json_encode([
        "success" => true,
        "data" => $result->fetch_assoc()
    ]);
} else {
    echo json_encode(["success" => false, "message" => "Data mahasiswa tidak ditemukan"]);
}
?>