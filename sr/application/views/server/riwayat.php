    <!-- Begin Page Content -->
    <div class="container-fluid">
        <h1 class="h3 mb-0 text-gray-800">SERVER</h1><br>


        <h1>testing</h1>


        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Tables</h1>
            <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="refresh" class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>

                                    <th>No</th>
                                    <th>Tanggal</th>
                                    <th>Atas Nama</th>
                                    <th>Jumlah Pesanan</th>
                                    <th>Total Harga</th>
                                    <th>Server</th>
                                    <th>Proses</th>
                                    <th>Keterangan</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $i = 1;
                                foreach ($riwayatPesanan as $rp) : ?>
                                    <tr>

                                        <td><?= $i; ?></td>
                                        <td><?= $rp['tanggal']; ?></td>
                                        <td><?= $rp['atas_nama']; ?></td>
                                        <td><?= $rp['jumlah_pesanan']; ?></td>
                                        <td>Rp. <?= number_format($rp['total_harga']); ?></td>
                                        <td><?= $rp['nama']; ?></td>
                                        <td><a href="#" class="<?= $rp['class2']; ?>"><i class="<?= $rp['simbol2']; ?>"></i></a></td>

                                        <td><a href="#" class=" <?= $rp['class']; ?>"><i class="<?= $rp['simbol']; ?>"></i></a></td>
                                    </tr>
                                <?php $i += 1;
                                endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->



    </div>
    <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <!-- <script>
        setInterval(function() {
            $.ajax({
                url: "<?= base_url("server/cek_status_masak"); ?>",
                type: "POST",
                dataType: "json",
                data: {},
                success: function(data) {
                    // $("refresh").html(data.cek['cl']);
                    console.log("ok");
                    //console.log(data.cek['jmh']);
                },
                error: function() {
                    console.log("gagal");
                }
            })

        }, 2000)
    </script> -->