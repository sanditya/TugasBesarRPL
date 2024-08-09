<?php
// koneksi database
include 'koneksi.php';
if (isset($_POST['simpan'])) {
    // menangkap data yang di kirim dari form
    $eldo_id_meja = $_POST['eldo_id_meja'];
    $eldo_keterangan = $_POST['eldo_keterangan'];
    $eldo_status = $_POST['eldo_status'];

    // update data ke database
    $sql = mysqli_query($eldo_koneksi, "UPDATE eldo_t_meja SET 
     eldo_keterangan='$eldo_keterangan', eldo_status='$eldo_status' WHERE eldo_id_meja='$eldo_id_meja'
    ") or die(mysqli_error($eldo_koneksi));

    if ($sql) {
        echo '<script>alert("Berhasil menyimpan data."); document.location="manajer_meja.php";</script>';
    } else {
        echo '<div class="alert alert-warning">Gagal melakukan proses edit data.</div>';
    }
}
