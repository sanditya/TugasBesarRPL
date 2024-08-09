<?php
// koneksi database
include 'koneksi.php';
if (isset($_POST['simpan'])) {
    // menangkap data yang di kirim dari form
    $eldo_id_meja = $_POST['eldo_id_meja'];
    $eldo_no_meja = $_POST['eldo_no_meja'];
    $eldo_keterangan = $_POST['eldo_keterangan'];
    $eldo_status = $_POST['eldo_status'];

    // update data ke database
    $sql = mysqli_query($koneksi, "UPDATE tbl_meja SET 
     eldo_no_meja='$eldo_no_meja', eldo_keterangan='$eldo_keterangan', eldo_status='$eldo_status' WHERE eldo_id_meja='$eldo_id_meja'
    ") or die(mysqli_error($koneksi));

    if ($sql) {
        echo '<script>alert("Berhasil menyimpan data."); document.location="meja.php";</script>';
    } else {
        echo '<div class="alert alert-warning">Gagal melakukan proses edit data.</div>';
    }
}
