<?php
include "koneksi.php";
$judul = "PAK RESTO UNIKOM";
include "header.php";
include "konfirmasi.php";
?>


 <!-- Begin Page Content -->
 <div class="container-fluid">

<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">Edit Meja</h1>

<?php
include 'koneksi.php';
$eldo_id_meja = $_GET['eldo_id_meja'];
$eldo_data = mysqli_query($koneksi, "SELECT * FROM tbl_meja where eldo_id_meja='$eldo_id_meja'");
while ($eldo_kelola = mysqli_fetch_array($eldo_data)) {
?>

    <form method="POST" action="aksi_edit_meja.php">
        <input type="hidden" name="eldo_id_meja" value="<?php echo $eldo_kelola['eldo_id_meja']; ?>">

        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">No Meja</label>
            <div class="col-sm-10">
                <input type="text" name="eldo_no_meja" class="form-control" value="<?php echo $eldo_kelola['eldo_no_meja']; ?>">
            </div>
        </div>

        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Keterangan</label>
            <div class="col-sm-10">
                <input type="text" name="eldo_keterangan" class="form-control" value="<?php echo $eldo_kelola['eldo_keterangan']; ?>">
            </div>
        </div>

        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Status</label>
            <div class="col-sm-10">
                <select class="form-control from control" name="eldo_status" value="<?php echo $eldo_kelola['eldo_status']; ?>">
                    <option>Kosong</option>
                    <option>Terisi</option>
                </select>
            </div>
        </div>

        <?php
        echo "
<button type='submit' class='btn btn-primary' name='simpan'>Selesai</button>
<a href='meja.php' class='btn btn-primary'>Kembali</a>
"; ?>
    </form>
<?php
}
?>






</div>

<?php include "footer.php"; ?>

<script>
    $(document).ready(function() {
        $('#meja').dataTable();
    });
</script>