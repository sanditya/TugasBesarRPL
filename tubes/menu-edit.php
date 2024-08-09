<?php
$judul = "EDIT MASTER MENU";
include "header.php";
include "koneksi.php";
$id_menu = $_GET['id_menu'];
$sql            = "SELECT * FROM tbl_menu WHERE id_menu = '$id_menu'";
$query          = mysqli_query($koneksi, $sql);
$data           = mysqli_fetch_array($query);
$id_jenis_menu  = $data['id_jenis_menu'];
?>

<div class="col-6">
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>Edit Master Menu</h1>
				<form action="menu-update.php" method="post">
					<input type="hidden" name="id_menu" value="<?= $id_menu;?>">
          <div class="input-group mb-1">
						<span class="input-group-text lebar" >Nama Menu</span>
						<input type="hidden" name="nama_menu1" value="<?= $data['nama_menu'];?>" >

						<input type="text" name="nama_menu" required autocomplete="off" class="form-control form-control-sm" placeholder="Masukan Nama Menu" value="<?= $data['nama_menu'];?>" >
					</div>
					<div class="input-group mb-1">
						<span class="input-group-text lebar" >Jenis Menu</span>
						<select name="id_jenis_menu" class="form-control form-control-sm" required>
              <?php
              $sql   = "SELECT * FROM tbl_jenis_menu";
              $query = mysqli_query($koneksi, $sql);
              while ($d = mysqli_fetch_array($query)){
                $id_jenis = $d['id_jenis_menu'];?>
							  <option value="<?= $id_jenis; ?>" <?php if($id_jenis == $id_jenis_menu){echo 'selected="selected"';}?> ><?= $d['jenis_menu']; ?></option>
                <?php 
              }?>
						</select>
					</div>
          <div class="input-group mb-1">
						<span class="input-group-text lebar" >Harga</span>
						<input type="text" name="harga" required autocomplete="off" class="form-control form-control-sm text-right money angkaSemua" placeholder="Masukan Harga" value="<?= $data['harga'];?>">
					</div>

					<div class="input-group mb-1">
						<button type="submit" class="btn btn-success btn-sm"><i class="fas fa-save"></i> Edit</button> | <a href="menu.php" class="btn btn-sm btn-secondary"><i class="fas fa-redo"></i> Kembali</a>
					</div>
				</table>
			</form>
		</div>
	</div>
</div>
<?php include "footer.php"; ?>
</div>
</div>
