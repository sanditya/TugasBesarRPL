<?php
// koneksi database
include 'koneksi.php';

// menangkap sebuah data yang dikirim dari form
$eldo_id_meja = $_POST['eldo_id_meja'];
$eldo_keterangan = $_POST['eldo_keterangan'];
$eldo_status = $_POST['eldo_status'];

// menginput data ke database
mysqli_query($eldo_koneksi, "INSERT INTO eldo_t_meja value('$eldo_id_meja', '$eldo_keterangan', '$eldo_status')");

header("location:manajer_meja.php");
