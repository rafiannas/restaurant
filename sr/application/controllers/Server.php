<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Server extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
    $this->load->library('form_validation');
    $this->load->model('ServerModal');

    // $this->load->model('chart_model');
  }

  public function index()
  {
    $this->form_validation->set_rules('username', 'Username', 'required|trim');
    $this->form_validation->set_rules('password', 'Password', 'required|trim');

    $data['title'] = 'Login Serer';

    if ($this->form_validation->run() == false) {
      $this->load->view('templates/auth_header', $data);
      $this->load->view('server/login_server');
      $this->load->view('templates/auth_footer');
    } else {
      $this->_login();
    }
  }


  private function _login()
  {
    $username = $this->input->post('username');
    $password = $this->input->post('password');


    $user = $this->db->get_where('karyawan', ['username' => $username])->row_array();

    if ($user)
    //jika karyawan ada
    {
      if ($user['password'] == $password) {
        $data = [
          'id_karyawan' => $user['id'],
          'role_id' => $user['role_id']
        ];
        $this->session->set_userdata($data);
        redirect('server/home');
      }
      $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Password Salah</div>');
      redirect('server');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Username Salah</div>');
      redirect('server');
    }
  }

  public function home()
  {
    $data['saya_karyawan'] = $this->db->get_where('karyawan', ['id' => $this->session->userdata('id_karyawan')])->row_array();
    $cek_awal = $this->db->query("SELECT * FROM pesanan WHERE id_status =1")->row_array();
    //klo ga ada
    if (!$cek_awal) {
      $isi = [
        'id_status' => 1,
      ];
      $this->db->insert('pesanan', $isi);
      //klo ada
    }
    $ada = $this->db->query("SELECT * FROM pesanan WHERE id_status =1")->row_array();
    $id = $ada['id'];
    $q_lp = "SELECT detail_pesanan.*, menu.nama_menu, menu.harga FROM detail_pesanan, menu WHERE id_pesanan = $id AND detail_pesanan.id_menu = menu.id ";


    $data['listPesanan'] = $this->db->query($q_lp)->result_array();
    // var_dump($ada);
    // var_dump($data['listPesanan']);


    $q = "SELECT COUNT(id) as jmh  FROM user";

    //$data['n'] =  $this->ServerModal->get()->row_array();
    //var_dump($data['n']); 

    $data['n'] = $this->db->query($q)->row_array();
    $data['listIkan'] = $this->ServerModal->getIkan();
    $data['listAyam'] = $this->ServerModal->getAyam();
    $data['listMinuman'] = $this->ServerModal->getMinuman();
    $data['title'] = 'Server';


    $this->form_validation->set_rules('qty', 'Qty', 'required|trim|integer');

    if ($this->form_validation->run() == false) {
      $this->load->view('templates/header');
      $this->load->view('templates/slidebar_sv');
      $this->load->view('templates/topbar', $data, $data);
      $this->load->view('server/home_sv', $data);
      $this->load->view('templates/footer');
    } else {
      $jmh_brg = $this->input->post('qty');
      $id_men = $this->input->post('id_b');

      $cekDulu = $this->db->query("SELECT * FROM detail_pesanan WHERE id_menu = $id_men AND id_pesanan = $id")->row_array();
      $id_det = $cekDulu['id'];
      // var_dump($cekDulu);
      // var_dump($id_det);
      // var_dump($id_men);
      // var_dump($id);
      // die;

      if ($cekDulu) {
        $this->db->set('jumlah', $jmh_brg);
        $this->db->where('id', $id_det);
        $this->db->update('detail_pesanan');
      } else {
        $isi = [
          'id_pesanan' => $id,
          'id_menu' => $id_men,
          'jumlah' => $jmh_brg,
        ];
        $this->db->insert('detail_pesanan', $isi);
      }
      redirect('server/home');
    }
  }
  public function hapus_barang($id)
  {
    $this->db->where('id', $id);
    $this->db->delete('detail_pesanan');


    redirect('server/home');
  }


  public function get_cek()
  {
    $ok = $this->ServerModal->get()->row_array();

    $result['cek'] = $ok;
    $result['msg'] = "Berhasil";
    echo json_encode($result);
  }
  public function cek_status_masak()
  {
    $ok = $this->ServerModal->getStatusMasak()->row_array();

    $result['cek'] = $ok;
    $result['msg'] = "Berhasil";
    echo json_encode($result);
  }
  public function logout()
  {
    $this->session->unset_userdata('id_karyawan');
    $this->session->unset_userdata('role_id');
    $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Berhasil Keluar</div>');
    redirect('server');
  }

  public function riwayat()
  {
    $data['saya_karyawan'] = $this->db->get_where('karyawan', ['id' => $this->session->userdata('id_karyawan')])->row_array();
    $data['riwayatPesanan'] = $this->ServerModal->riwayat();

    $this->load->view('templates/header');
    $this->load->view('templates/slidebar_sv');
    $this->load->view('templates/topbar', $data);
    $this->load->view('server/riwayat', $data);
    $this->load->view('templates/footer');
  }
  public function konfirmasi()
  {
    $data['saya_karyawan'] = $this->db->get_where('karyawan', ['id' => $this->session->userdata('id_karyawan')])->row_array();
    $this->form_validation->set_rules('nama', 'Nama', 'required|trim');
    $ini_pesanan = $this->db->get_where('pesanan', ['id_status' => 1])->row_array();
    $id_pesanan = $ini_pesanan['id'];

    $data['konfirm'] = $this->ServerModal->getKonfirmasi();
    $temp =  $data['konfirm'];
    $i = 1;
    $j = 0;
    $tot = 0;

    foreach ($temp as $t) {
      $j = $t['harga'] * $t['jumlah'];
      $tot += $j;
      $i += 1;
    }


    $jmh = count($temp);
    $tgl = date("d-m-Y h:i:s");


    // $jmh= $data['konfirm']['']

    if ($this->form_validation->run() == false) {
      $this->load->view('templates/header');
      $this->load->view('templates/slidebar_sv');
      $this->load->view('templates/topbar', $data);
      $this->load->view('server/konfirmasi', $data);
      $this->load->view('templates/footer');
    } else {
      $nama = $this->input->post('nama');

      $inp = [
        'atas_nama' => $nama,
        'jumlah_pesanan' => $jmh,
        'tanggal' => $tgl,
        'total_harga' => $tot,
        'id_status' => 2, //status server&kasie
        'id_status2' => 1, //status dapur
        'server' => $this->session->userdata('id_karyawan'),
        'note' => $this->input->post('note')
      ];

      $this->db->where('id', $id_pesanan);
      $this->db->update('pesanan', $inp);

      $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Pesanan Berhasil !</div>');
      redirect('server/home');
    }
  }
}
