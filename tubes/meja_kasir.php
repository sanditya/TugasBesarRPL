<?php
include "koneksi.php";
$judul = "PAK RESTO UNIKOM";
include "header.php";
include "konfirmasi.php";
?>

<div class="col">
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <h2>DAFTAR MEJA</h2>
                <hr>

                <?php
                // klik simpan
                if (isset($_POST['bsimpan'])) {
                    //uji data edit atau di simpan baru
                    if ($_GET['hal'] == "edit") {
                        // data akan di edit
                        $edit = mysqli_query($koneksi, "UPDATE tbl_meja set

eldo_status='$_POST[status]'
WHERE eldo_id_meja = '$_GET[id]'
");
                        if ($edit) {
                            echo "<script>
    alert('edit data sukses!');
    document.location = 'meja_kasir.php';
</script>";
                        } else {
                            echo "<script>
    alert('edit data gagal!');
    document.location = 'meja_kasir.php';
</script>";
                        }
                    } else {
                        //data akan di simpan baru
                        $simpan = mysqli_query($koneksi, "INSERT INTO tbl_meja(eldo_no_meja,eldo_keterangan,eldo_status)
VALUES ('$_POST[meja]',
'$_POST[keterangan]',
'$_POST[status]')
");
                        if ($simpan) {
                            echo "<script>
    alert('simpan data sukses!');
    document.location = 'meja_kasir.php';
</script>";
                        } else {
                            echo "<script>
    alert('simpan data gagal!');
    document.location = 'meja_kasir.php';
</script>";
                        }
                    }
                }

                //uji edit/hapus klik
                if (isset($_GET['hal'])) {
                    //edit data
                    if ($_GET['hal'] == "edit") {
                        //tampil data edit
                        $tampil = mysqli_query($koneksi, "SELECT * FROM tbl_meja WHERE eldo_id_meja='$_GET[id]'");
                        $data = mysqli_fetch_array($tampil);
                        if ($data) {
                            //tampung data pada variable
                            $vno = $data['eldo_id_meja'];
                            $vstatus = $data['eldo_status'];
                        }
                    } else if ($_GET['hal'] == "hapus") {
                        //persiapan hapus data
                        $hapus = mysqli_query($koneksi, "DELETE FROM tbl_meja WHERE eldo_id_meja='$_GET[id]'");
                        if ($hapus) {
                            echo "<script>
    alert('hapus data sukses!');
    document.location = 'meja_kasir.php';
</script>";
                        }
                    }
                }
                ?>
                <div class="container">

                    <!-- awal card table-->
                    <div class="card mt-3 ">
                        <div class="card-header bg-primary text-white">
                            Data Meja
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <th>No.</th>
                                    <th>Id Meja</th>
                                    <th>No Meja</th>
                                    <th>Keterangan</th>
                                    <th>Status</th>
                               
                                </tr>
                                <?php
                                $no = 1;
                                $tampil = mysqli_query($koneksi, "SELECT * from tbl_meja order by eldo_id_meja");
                                while ($data = mysqli_fetch_array($tampil)) :
                                ?>
                                    <tr>
                                        <td><?= $no++; ?></td>
                                        <td><?= $data['eldo_id_meja'] ?></td>
                                        <td><?= $data['eldo_no_meja'] ?></td>
                                        <td><?= $data['eldo_keterangan'] ?></td>
                                        <td><?= $data['eldo_status'] ?></td>
                                    </tr>
                                <?php endwhile ?>
                                <!--penutup perulangan-->
                            </table>
                        </div>
                    </div>
                    <!--akhir card tabel-->
                </div>

            </div>
        </div>
    </div>
</div>
<?php include "footer.php"; ?>

<script>
    $(document).ready(function() {
        $('#meja').dataTable();
    });
</script>