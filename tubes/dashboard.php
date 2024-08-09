<?php
include "koneksi.php";
$judul = "PAK RESTO UNIKOM";
include "header.php";
?>

<div class="col">
  <div class="container">
    <!-- Selamat Datang -->
    <div class="col">
      <h1 class="display-4">Hai <?= $nama_pegawai; ?></h1>
      <h1 class="display-5">Anda Login Sebagai <?= $jabatan; ?></h1>
      <p class="lead">PAK RESTO UNIKOM</p>
      <hr class="my-3">
    </div>
    <!-- End Selamat Datang -->

  </div>

  <?php include "footer.php"; ?>