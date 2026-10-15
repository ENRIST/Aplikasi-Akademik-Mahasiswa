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

// 1. Ambil data nilai mata kuliah
$queryKHS = "SELECT id, mata_kuliah, CONCAT(sks, ' SKS') AS sks, nilai, bobot FROM khs WHERE nim = '$nim'";
$resultKHS = $koneksi->query($queryKHS);

$listKHS = [];
$totalSKS = 0;
$totalBobotxSKS = 0;

if ($resultKHS && $resultKHS->num_rows > 0) {
    while ($row = $resultKHS->fetch_assoc()) {
        $listKHS[] = $row;
        
        // Hitung total SKS dan Ringkasan Nilai
        $sksNum = (int)$row['sks'];
        $bobotNum = (float)$row['bobot'];
        
        $totalSKS += $sksNum;
        $totalBobotxSKS += ($sksNum * $bobotNum);
    }
    
    // Hitung Indeks Prestasi Semester (IPS)
    $ips = $totalSKS > 0 ? number_format($totalBobotxSKS / $totalSKS, 2) : "0.00";

    echo json_encode([
        "success" => true,
        "summary" => [
            "total_sks" => $totalSKS . " SKS",
            "ips" => $ips,
            "ipk" => "3.65" // nilai contoh untuk IPK akumulatif
        ],
        "data" => $listKHS
    ]);
} else {
    echo json_encode([
        "success" => false, 
        "message" => "Data KHS tidak ditemukan untuk NIM tersebut"
    ]);
}
?>