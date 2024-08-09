<?php
include "koneksi.php";
$judul = "PAK RESTO UNIKOM";
include "header.php";
?>

<div class="col">
	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<h2>Log Pegawai</h2><br><br>
				<hr>

				<table class="table table-bordered table-hover" id="log">
					<thead>
						<tr class="text-center">
							<th>No.</th>
							<th>Nama Pegawai</th>
							<th>Jabatan</th>
							<th>Aksi</th>
							<th>Tanggal</th>
							<?php
							if ($jabatan == "Manajer") { ?>
								<th>Aksi</th>
							<?php
							} ?>
						</tr>
					</thead>
					<tbody>
						<?php
						$no = 1;
						$sql = "SELECT * FROM tbl_log ORDER BY id_log DESC";
						$query = mysqli_query($koneksi, $sql);
						while ($data = mysqli_fetch_array($query)) {
							$aksi = $data['aksi'];
							$id_pegawai   = $data['id_pegawai'];
							$nama_pegawai = $data['nama_pegawai'];
							$jbt          = $data['jabatan'];

							if ($nama_pegawai == "Belum Ada Pengguna") {
								$sql1   = "SELECT * FROM tbl_pegawai WHERE id_pegawai = '$id_pegawai'";
								$query1 = mysqli_query($koneksi, $sql1);
								$data1  = mysqli_fetch_array($query1);

								$nm_peg = $data1['nama_pegawai'];
								$jbt = $data1['jabatan'];

								$sql2         = "UPDATE tbl_log SET 
                  nama_pegawai= '$nm_peg',
                  jabatan     = '$jbt'
                WHERE id_pegawai = '$id_pegawai'";
								mysqli_query($koneksi, $sql2);
								$nama_pegawai = $nm_peg;
							}
						?>
							<tr>
								<td align="center" width="5%"><?= $no++; ?>.</td>
								<td width="22%"><?= $nama_pegawai; ?></td>
								<td><?= $jbt; ?></td>
								<td><?= $aksi; ?></td>
								<td align="center" width="18%"><?= $data['date']; ?></td>
								<?php
								if ($jabatan == "Manajer") { ?>
									<td align="center" width="5%"><a href="log-delete.php?id_log=<?= $data['id_log']; ?>" onclick="return confirm('Data akan dihapus?');" class="badge badge-danger p-2" title="Delete"><i class="fas fa-trash"></i></a> </td>
								<?php
								} ?>
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
		$('#log').dataTable();
	});
</script>