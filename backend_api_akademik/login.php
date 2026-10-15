<?php
header("Content-Type: application/json");
require_once "koneksi.php";

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

if (empty($email) || empty($password)) {
    echo json_encode(["success" => false, "message" => "Email dan password wajib diisi"]);
    exit;
}

$query = "SELECT nim, nama, email, prodi FROM mahasiswa WHERE email = '$email' AND password = '$password'";
$result = $koneksi->query($query);

if ($result && $result->num_rows > 0) {
    $user = $result->fetch_assoc();
    echo json_encode([
        "success" => true,
        "message" => "Login berhasil",
        "data" => $user
    ]);
} else {
    echo json_encode(["success" => false, "message" => "Email atau password salah"]);
}
?>