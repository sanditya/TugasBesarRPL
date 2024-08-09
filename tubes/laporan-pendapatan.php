<?php
include "koneksi.php";
$judul = "PAK RESTO UNIKOM";
include "header.php";
include "konfirmasi.php";
$waktu = date('Y-m-d');

?>
<?php
// Total Pendapatan
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi";
$query = mysqli_query($koneksi, $sql);
$data  = mysqli_fetch_array($query);
$ttl   = $data['jml'];

// Total pendapatan harian 
$sql1   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE tgl_transaksi = '$waktu'";
$query1 = mysqli_query($koneksi, $sql1);
$data1  = mysqli_fetch_array($query1);
$hr     = $data1['jml'];
?>

<div class="row mt-3 ml-3 ">
    <!-- Total Pendapatan -->
    <div class="col-xl-3 col-md-6 mb-2">
        <div class="card border-left-danger shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="font-weight-bold text-danger text-uppercase mb-1">
                            Total Pendapatan</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?= number_format($ttl); ?> </div>
                    </div>
                    <div class="col-auto">
                        <i class="fa fa-gift fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Penerimaan Hari ini -->
    <div class="col-xl-3 col-md-6 mb-2">
        <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="font-weight-bold text-warning text-uppercase mb-1">Pendapatan Hari Ini
                        </div>
                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><?= number_format($hr); ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fa fa-credit-card fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include "footer.php"; ?>