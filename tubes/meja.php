<?php
include "koneksi.php";
$judul = "PAK RESTO UNIKOM";
include "header.php";
include "konfirmasi.php";
?>


<div class="container-fluid">

<!-- Page Heading -->
<div class="col">
	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<h2>Data Meja</h2>
				<hr>

<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <a href="tambah_meja.php" class="btn btn-primary">Tambah Data Meja</a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Id Meja</th>
                        <th>No Meja</th>
                        <th>Keterangan</th>
                        <th>Status</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <?php
                include 'koneksi.php';
                $eldo_nomor = 1;
                $eldo_data = mysqli_query($koneksi, "SELECT * FROM tbl_meja");
                while ($eldo_kelola = mysqli_fetch_array($eldo_data)) {
                ?>
                    <tr>
                        <td><?php echo $eldo_nomor++; ?></td>
                        <td><?php echo $eldo_kelola['eldo_id_meja']; ?></td>
                        <td>Meja <?php echo $eldo_kelola['eldo_no_meja']; ?></td>
                        <td><?php echo $eldo_kelola['eldo_keterangan']; ?></td>
                        <td><?php echo $eldo_kelola['eldo_status']; ?></td>
                        <td>
                            <?php
                            echo "
                            <a href='edit_meja.php?eldo_id_meja=$eldo_kelola[eldo_id_meja]' class='btn btn-success'>Edit</a>
                            <a href='hapus_meja.php?eldo_id_meja=$eldo_kelola[eldo_id_meja]' class='btn btn-danger' onclick='return confirm('Yakin ingin menghapus data ini?')'>Hapus</a>
                            
                            "; ?>
                        </td>

                    </tr>
                <?php
                }
                ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

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