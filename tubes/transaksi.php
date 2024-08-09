<?php
$judul = "PAK RESTO UNIKOM";
include "header.php";
include "koneksi.php";
?>

<div class="col">
  <div class="container">
    <div class="row">
      <div class="col-5" style="margin-left: -25px;">
        <div class="card border-success shadow-lg mb-3">
          <div class="card-header bg-primary border-success text-light"><b>PAK RESTO UNIKOM</b></div>
          <div class="card-body">
            <form action="" method="post" id="transaksiMenu">
              <input type="hidden" name="no_transaksi" id="no_transaksi">

              <!-- Tanggal -->
              <div class="input-group mb-1">
                <span class="input-group-text lebar"> Tanggal</span>
                <input type="date" name="tgl_transaksi" required autocomplete="off" class="form-control form-control-sm" value="<?= $tglHariIni; ?>" required>
              </div>

              <!-- Nama Menu -->
              <div class="input-group mb-1">
                <select name="id_menu" id="id_menu" class="form-control form-control-sm form-control-chosen" required>
                  <option value="" selected>~ Pilih Nama Menu ~</option>
                  <?php
                  include "koneksi.php";
                  $sql = "SELECT * FROM tbl_menu ORDER BY nama_menu";
                  $query = mysqli_query($koneksi, $sql);
                  while ($data = mysqli_fetch_array($query)) { ?>
                    <option value=<?= $data['id_menu']; ?>> <?= $data['nama_menu']; ?> - Rp. <?= number_format($data['harga']); ?> </option>
                  <?php
                  }
                  ?>
                </select>
              </div>

              <!-- Harga -->
              <div class="input-group mb-1">
                <span class="input-group-text lebar">Harga</span>
                <input type="text" name="harga" class="form-control form-control-sm money text-right" id="harga" value="0" readonly required>
              </div>

              <!-- Banyak / Qty -->
              <div class="input-group mb-1">
                <span class="input-group-text lebar">Qty</span>
                <input type="text" name="qty" id="qty" required class="form-control form-control-sm text-right money angkaSemua" autocomplete="off" placeholder="Masukan Qty">
              </div>

              <!-- No Meja -->
              <div class="input-group mb-1">
                <span class="input-group-text lebar">No Meja</span>
                <input type="text" name="no_meja" id="idMeja" required class="form-control form-control-sm text-right money angkaSemua" autocomplete="off" placeholder="Masukan No Meja">
              </div>
              <!-- Catatan  -->
              <div class="input-group mb-1">
                <span class="input-group-text lebar">Catatan</span>
                <input type="text" name="catatan" id="catatan" required class="form-control form-control-sm text-right " autocomplete="off" placeholder="Masukan catatan">
              </div>
        
              <div class="modal-footer">
                <a class="btn btn-primary btn-sm text-white" id="transaksiSimpan"><i class="fas fa-save"></i> Simpan</a>
              </div>
            </form>
          </div>
          <div class="card-footer bg-primary border-success text-light">
            Nama Kasir : <?= strtoupper($nama_pegawai); ?></br>
            Tanggal : <?= date('d M Y'); ?> - <span class="text-right" id="jamKunjung"></span>
          </div>
        </div>
      </div>

      <!-- Detail Transaksi -->
      <div class="col-7" style="margin-left: -25px;">
        <div class="card border-success mb-3">
          <div class="card-header bg-primary border-success text-light">No. Transaksi - <span id="noTransaksiBaru"></span> </div>
          <div class="card-body text-success">
            <div class="tampilkanTransaksiDetail">
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name Menu</th>
                    <th scope="col">Harga</th>
                    <th scope="col">Qty</th>
                    <th scope="col">Subtotal</th>
                    <th scope="col">Aksi</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
          <div class="card-footer bg-primary border-success text-light">
            <table width="100%">
            <tr>
                <td>Total Bayar</td>
                <td style="float: right;">
                  <input type="text" name="totalBayar" id="totalBayar" class="form-control form-control-sm money angkaSemua text-right">
                </td>
              </tr>
              
              <tr>
                <td>Total Keseluruhan </td>
                <td style="float: right;">
                  <input type="text" id="totalTransaksi" class="form-control form-control-sm text-right" readonly>
                </td>
              </tr>
              
              <tr>
                <td>Total Kembali</td>
                <td style="float: right;">
                  <input type="text" name="totalKembali" class="form-control form-control-sm text-right" readonly>
                </td>
              </tr>
              <tr>
                <td></td>
                <td style="float: right;"><a class="btn btn-success btn-sm text-white mt-1" id="transaksiBayar"><i class="fas  fa-dollar-sign"></i> Bayar</a></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<?php include "footer.php"; ?>

<script>
  $(document).ready(function() {
    $(document).on('change', '#id_menu', function() {
      var id_menu = $(this).val();
      $.ajax({
        method: 'POST',
        data: {
          id_menu: id_menu
        },
        url: 'transaksi-cari-ajax.php',
        cache: false,
        success: function(result) {
          $('[name="harga"]').val(result);
        }
      });
    });

    // Simpan
    $(document).on('click', '#transaksiSimpan', function() {
      var idHarga = $('[name="harga"]').val();
      var idQty = $('[name="qty"]').val();
      var idMeja = $('[name="no_meja"]').val();
      var catatan = $('[name="catatan"]').val();

      if (idHarga == "0" || idHarga == "") {
        alert('Menu belum dipilih !');
        $('[name="id_menu"]').focus();
      } else if (idQty == "") {
        alert('Qty belum diisi !');
        $('[name="qty"]').focus();
      } else if (idMeja == "") {
        alert('No Meja belum diisi !');
        $('[name="idMeja"]').focus();
      } else {
        if (confirm('Data akan disimpan ?')) {
          var data = $('#transaksiMenu').serialize();
          $.ajax({
            method: 'POST',
            data: data,
            url: 'transaksi-simpan-ajax.php',
            cache: false,
            success: function(result) {
              var row = JSON.parse(result);
              var noTransaksi = row.no_transaksi;
              var numb = row.total_transaksi;
              const format = numb.toString().split('').reverse().join('');
              const convert = format.match(/\d{1,3}/g);
              const totalTransaksi = convert.join(',').split('').reverse().join('');

              $('#noTransaksiBaru').text(noTransaksi);
              $("#no_transaksi").val(noTransaksi);
              $("#totalTransaksi").val(totalTransaksi);
              $("#id_menu").val('');
              $('#id_menu').trigger("chosen:updated");
              $("[name='harga']").val('0');
              $("#qty").val('');
                            $("#catatan").val('');

              $("[name='no_meja']").attr('readonly', true);
              $("[name='tgl_transaksi']").attr('readonly', true);
              $('.tampilkanTransaksiDetail').load('transaksi-detail.php', {
                noTransaksi: noTransaksi
              });
            }
          });
        } else {
          preventDefault();
        }
      }
    });

    // Hapus
    $(document).on('click', '.transaksiAksi', function() {
      var id_detail = $(this).attr('id');
      $.ajax({
        method: 'POST',
        data: {
          id_detail: id_detail
        },
        url: 'transaksi-delete-ajax.php',
        cache: false,
        success: function(noTrans) {
          if (noTrans == 0) {
            var noTransaksi = 0;
            $('#noTransaksiBaru').text('');
            $("#no_transaksi").val('');
            $("#totalTransaksi").val('');
            $("#ttlTransaksi").val('');
            $("#id_menu").val('');
            $('#id_menu').trigger("chosen:updated");
            $("[name='harga']").val('0');
            $("#qty").val('');
            $("#idMeja").val('');
            $("[name='totalKembali']").val('');
            $('#totalBayar').val('');
            $("[name='no_meja']").attr('readonly', false);
            $("[name='tgl_transaksi']").attr('readonly', false);
          } else {
            var noTransaksi = noTrans.substring(0, 17);
            var ttl = noTrans.length;
            var numb = noTrans.substring(ttl, 17);

            const format = numb.toString().split('').reverse().join('');
            const convert = format.match(/\d{1,3}/g);
            const ttlTransaksi = convert.join(',').split('').reverse().join('');

            $("#totalTransaksi").val(ttlTransaksi);
          }
          $('.tampilkanTransaksiDetail').load('transaksi-detail.php', {
            noTransaksi: noTransaksi
          });
        }
      });
    });

    // Bayar
    $(document).on('click', '#transaksiBayar', function() {
      var noTransaksi = $('#noTransaksiBaru').text();
      var noTrans = "cetak_struk.php?no_transaksi=" + noTransaksi;
      var totalTransaksi = $('#totalTransaksi').val();
      var ttlTransaksi = totalTransaksi.replace(",", "");
      var totalBayar = $('[name="totalBayar"]').val();
      var ttlBayar = totalBayar.replaceAll(",", "");
      var cetak = "cetak_struk";
      if (ttlBayar != "" && parseInt(ttlBayar) >= parseInt(ttlTransaksi)) {
        $.ajax({
          method: 'POST',
          data: {
            noTransaksi: noTransaksi,
            totalBayar: totalBayar
          },
          url: 'transaksi-bayar-ajax.php',
          cache: false,
          success: function() {
            var noTransaksi = "";
            $('#noTransaksiBaru').text('');
            $("#no_transaksi").val('');
            $("#totalTransaksi").val('');
            $("#id_menu").val('');
            $('#id_menu').trigger("chosen:updated");
            $("[name='harga']").val('0');
            $("#qty").val('');
            $("#idMeja").val('');
            $("[name='no_meja']").attr('readonly', false);
            $("[name='tgl_transaksi']").attr('readonly', false);
            $('.tampilkanTransaksiDetail').load('transaksi-detail.php', {
              noTransaksi: noTransaksi
            });
            $("[name='totalBayar']").val('');
            $("[name='totalKembali']").val('');
            window.open(noTrans, '_blank');


          }

        })
      } else {
        alert('Total Bayar Kurang !');
      }
    });

    // Kembali
    $(document).on('keyup', '#totalBayar', function() {
      var totalTransaksi = $('#totalTransaksi').val();
      var ttlTransaksi = totalTransaksi.replace(",", "");
      var totalBayar = $('#totalBayar').val();
      var ttlBayar = totalBayar.replaceAll(",", "");
      var a = parseInt(ttlTransaksi) - parseInt(ttlBayar);
      const format = a.toString().split('').reverse().join('');
      const convert = format.match(/\d{1,3}/g);
      const b = convert.join(',').split('').reverse().join('');
      $('[name="totalKembali"]').val(b);
    });


  });

  $('.form-control-chosen').chosen({
    allow_single_deselect: true,
  });
</script>