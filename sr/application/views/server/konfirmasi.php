    <!-- Begin Page Content -->
    <div class="container-fluid">
        <h1 class="h3 mb-0 text-gray-800">SERVER</h1><br>


        <h1>Konfirmasi</h1>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <form action="" method="post">
                        <span style="margin-left: 40%"><b>Nama Pemesan</b></span>
                        <input type="text" class="form-control form-control-user" name="nama" id="nama" placeholder="Nama Pemesan">
                        <?= form_error('nama', '<small class="text-danger pl-3">', '</small>');  ?>
                        <br>

                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Menu</th>
                                    <th scope="col">Jumlah</th>
                                    <th scope="col">Harga Satuan</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $i = 1;
                                $ttl = 0;
                                foreach ($konfirm as $k) :
                                ?>
                                    <tr>
                                        <th scope="row"><?= $i; ?></th>
                                        <td><?= $k['nama_menu']; ?></td>
                                        <td><?= $k['jumlah']; ?></td>
                                        <td>Rp.<?= number_format($k['harga']); ?></td>
                                        <?php $tot = $k['harga'] * $k['jumlah'];
                                        $ttl += $tot; ?>
                                        <td>Rp.<?= number_format($tot); ?></td>
                                    </tr>
                                <?php $i += 1;
                                endforeach; ?>

                            </tbody>
                        </table>
                        <th class="ml-3">Total ...</th>
                        <th><b>Rp. <?= number_format($ttl); ?></b></th>
                        <br><br>
                        <span style="margin-left: 45%"><b>Note</b></span>
                        <input type="text" class="form-control form-control-user" name="note" id="note" placeholder="Note"><br>
                        <button type="submit" class="btn btn-primary btn-user btn-block">
                            Pesan
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    </div>

    </div>
    <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->