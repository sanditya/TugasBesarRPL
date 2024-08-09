<?php
include "koneksi.php";
$judul = "PAK RESTO UNIKOM";
include "header.php";
include "konfirmasi.php";
?>

<div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">Tambah Meja</h1>
                    <form method="POST" action="aksi_tambah_meja.php">

                    <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Nomor Meja</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="eldo_no_meja">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Keterangan Meja</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="eldo_keterangan">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Status</label>
                            <div class="col-sm-10">
                                <select class="form-control from control-lg" name="eldo_status">
                                    <option>kosong</option>
                                </select>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">Tambahkan</button>
                        <a href="meja.php" class="btn btn-primary">Kembali</a>
                    </form>


                </div>
                <!-- /.container-fluid -->

            </div>
            <?php include "footer.php"; ?>
<script>
    $(document).ready(function() {
        $('#meja').dataTable();
    });
</script>