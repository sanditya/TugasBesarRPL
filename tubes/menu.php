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
				<h2>Daftar Menu</h2>
				<hr>
				<button type="button" class="badge badge-primary p-2 mb-3" data-toggle="modal" data-target="#staticBackdrop">
					<i class="fas fa-plus"></i> Tambah
				</button>

				<?php konfirmasi(); ?>
				<table class="table table-bordered table-hover" id="menu" width="100%" cellspacing="0">
					<thead>
						<tr class="text-center">
							<th>No.</th>
							<th>Nama Menu</th>
							<th>Jenis Menu</th>
							<th>Harga</th>
							<th>Aksi</th>
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
								<td align="center" width="25%"><a href="menu-edit.php?id_menu=<?= $data['id_menu']; ?>" class="badge badge-primary p-2" title="Edit"><i class="fas fa-edit"></i></a> | <a href="menu-delete.php?id_menu=<?= $data['id_menu']; ?>" onclick="return confirm('Data akan dihapus?');" class="badge badge-danger p-2" title='Delete'><i class="fas fa-trash"></i></a> </td>
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
<!-- Modal Tambah-->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">
					Masukan Data Menu
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="menu-simpan.php" method="post">
					<input type="hidden" name="id_pegawai" value="<?= $id_pegawai; ?>">
					<div class="input-group mb-1">
						<span class="input-group-text lebar">Nama Menu</span>
						<input type="text" name="nama_menu" required autocomplete="off" class="form-control form-control-sm" placeholder="Masukan Nama Menu">
					</div>
					<div class="input-group mb-1">
						<span class="input-group-text lebar">Jenis Menu</span>
						<select name="id_jenis_menu" class="form-control form-control-sm" required>
							<option value="" selected>~ Pilih Jenis Menu ~</option>
							<?php
							$sql   = "SELECT * FROM tbl_jenis_menu ORDER BY jenis_menu";
							$query = mysqli_query($koneksi, $sql);
							while ($d = mysqli_fetch_array($query)) { ?>
								<option value="<?= $d['id_jenis_menu']; ?> "><?= $d['jenis_menu']; ?></option>
							<?php
							} ?>
						</select>
					</div>
					<div class="input-group mb-1">
						<span class="input-group-text lebar">Harga</span>
						<input type="text" name="harga" required autocomplete="off" class="form-control form-control-sm text-right money angkaSemua" placeholder="Masukan Harga">
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-primary btn-sm"><i class="fas fa-save"></i> Simpan</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#menu').dataTable();
	});
</script>