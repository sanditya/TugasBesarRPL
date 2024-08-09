<?php
//include file koneksi
include('koneksi.php');

//jika benar mendapatkan GET id dari URL
if (isset($_GET['eldo_id_meja'])) {
    //membuat variabel $id yang menyimpan nilai dari $_GET['id']
    $eldo_id_meja = $_GET['eldo_id_meja'];

    //melakukan query ke database, dengan cara SELECT data yang memiliki id yang sama dengan variabel $id
    $eldo_cek = mysqli_query($eldo_koneksi, "SELECT * FROM eldo_t_meja WHERE eldo_id_meja='$eldo_id_meja'") or die(mysqli_error($eldo_koneksi));

    //jika query menghasilkan nilai > 0 maka eksekusi script di bawah
    if (mysqli_num_rows($eldo_cek) > 0) {
        //query ke database DELETE untuk menghapus data dengan kondisi id=$id
        $eldo_hapus = mysqli_query($eldo_koneksi, "DELETE FROM eldo_t_meja WHERE eldo_id_meja='$eldo_id_meja'") or die(mysqli_error($eldo_koneksi));
        if ($eldo_hapus) {
            echo '<script>alert("Berhasil menghapus data.");</script>';
            header("location:manajer_meja.php");
        } else {
            echo '<script>alert("Gagal menghapus data.");</script>';
            header("location:manajer_meja.php");
        }
    } else {
        echo '<script>alert("ID tidak ditemukan di database.");</script>';
        header("location:manajer_meja.php");
    }
} else {
    echo '<script>alert("ID tidak ditemukan di database.");</script>';
    header("location:manajer_meja.php");
}
