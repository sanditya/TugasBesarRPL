<?php
include "koneksi.php";
$id_jenis_menu  = $_POST['id_jenis_menu'];
$jenis_menu     = $_POST['jenis_menu'];
$jenis_menu1    = $_POST['jenis_menu1'];

if($jenis_menu != $jenis_menu1){
  $sql 		= "SELECT * FROM tbl_jenis_menu WHERE jenis_menu = '$jenis_menu' ORDER BY jenis_menu";
  $query 	= mysqli_query($koneksi, $sql);
  if(mysqli_num_rows($query)>0){
    header("location:jenis-menu.php?hasil=4");
  }else{
    $sql = "UPDATE tbl_jenis_menu SET 
      jenis_menu  = '$jenis_menu'
    WHERE id_jenis_menu = '$id_jenis_menu'";
    mysqli_query($koneksi, $sql);
    header("location:jenis-menu.php?hasil=2");
  }
}else{
  header("location:jenis-menu.php");
}
?>
