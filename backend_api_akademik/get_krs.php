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

// Ambil data mata kuliah yang diambil
$queryKRS = "SELECT id, mata_kuliah, CONCAT(sks, ' SKS') AS sks, sks AS sks_angka FROM krs WHERE nim = '$nim'";
$resultKRS = $koneksi->query($queryKRS);

$listKRS = [];
$totalSKS = 0;

if ($resultKRS && $resultKRS->num_rows > 0) {
    while ($row = $resultKRS->fetch_assoc()) {
        $totalSKS += (int)$row['sks_angka'];
        
        // Hapus variabel temporary agar output JSON bersih
        unset($row['sks_angka']);
        $listKRS[] = $row;
    }

    echo json_encode([
        "success" => true,
        "summary" => [
            "total_sks" => $totalSKS . " SKS"
        ],
        "data" => $listKRS
    ]);
} else {
    echo json_encode([
        "success" => false, 
        "message" => "Data KRS tidak ditemukan untuk NIM tersebut"
    ]);
}
?>