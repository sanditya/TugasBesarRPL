<?php
include "koneksi.php";
$judul = "PAK RESTO UNIKOM";
include "header.php";
?>

<div class="col">
	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<h2>Laporan Menu</h2><br><br>
				<a href="cetak-laporan-menu.php" class="btn btn-sm btn-success text-white" target="_blank"><i class="fas fa-print"></i> Cetak Daftar Menu</a>
				<hr>

				<table class="table table-bordered table-hover" id="laporanMenu">
					<thead>
						<tr class="text-center">
							<th>No.</th>
							<th>Nama Menu</th>
							<th>Jenis Menu</th>
							<th>Harga</th>
						</tr>
					</thead>
					<tbody>
						<?php
						$no 		= 1;
						$sql 		= "SELECT * FROM tbl_menu a INNER JOIN tbl_jenis_menu b ON a.id_jenis_menu = b.id_jenis_menu";
						$query 	= mysqli_query($koneksi, $sql);
						while ($data = mysqli_fetch_array($query)) { ?>
							<tr>
								<td align="center" width="5%"><?= $no++; ?>.</td>
								<td><?= $data['nama_menu']; ?></td>
								<td><?= $data['jenis_menu']; ?></td>
								<td align="right"><?= number_format($data['harga']); ?></td>
							</tr>
						<?php
						} ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<?php include "footer.php"; ?>
<script>
	$(document).ready(function() {
		$('#laporanMenu').dataTable();
		$('.form-control-chosen').chosen({
			allow_single_deselect: true,
		});
	});
</script>