<?php
$judul = "PAK RESTO UNIKOM";
include "header.php";
include "koneksi.php";
?>

<div class="col">
  <div class="container">
    <div class="row">
      

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