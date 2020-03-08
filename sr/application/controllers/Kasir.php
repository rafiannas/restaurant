<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Kasir extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
    $this->load->library('form_validation');
    // $this->load->model('chart_model');
    $this->load->model('KasirModal');
  }

  public function index()
  {
    $this->form_validation->set_rules('username', 'Username', 'required|trim');
    $this->form_validation->set_rules('password', 'Password', 'required|trim');

    $data['title'] = 'Login Kasir';
    if ($this->form_validation->run() == false) {

      $this->load->view('templates/auth_header', $data);
      $this->load->view('kasir/login_kasir');
      $this->load->view('templates/auth_footer');
    } else {
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
          redirect('kasir/home');
        }
        $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Password Salah</div>');
        redirect('kasir');
      } else {
        $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Username Salah</div>');
        redirect('kasir');
      }
    }
  }
  public function home()
  {

    $data['saya_karyawan'] = $this->db->get_where('karyawan', ['id' => $this->session->userdata('id_karyawan')])->row_array();
    $data['listPesanan'] = $this->KasirModal->getkasirNow()->result_array();

    $this->load->view('templates/header');
    $this->load->view('templates/slidebar_ks');
    $this->load->view('templates/topbar', $data, $data);
    $this->load->view('kasir/home_ks', $data);
    $this->load->view('templates/footer');
  }
  public function detail_ks($id)
  {

    $data['saya_karyawan'] = $this->db->get_where('karyawan', ['id' => $this->session->userdata('id_karyawan')])->row_array();
    $data['rinci'] = $this->KasirModal->getDetail($id)->result_array();
    $data['dipilih'] = $this->KasirModal->getGantiKs($id)->row_array();
    $data['pilihan2'] = $this->db->get('status')->result_array();

    $this->form_validation->set_rules('id_p', 'Id_p', 'required|trim');

    if ($this->form_validation->run() == false) {

      $this->load->view('templates/header');
      $this->load->view('templates/slidebar_ks');
      $this->load->view('templates/topbar', $data);
      $this->load->view('kasir/detail_ks', $data);
      $this->load->view('templates/footer');
    } else {
      $id_p = $this->input->post('id_p');
      $id_s = $this->input->post('status2');

      $update = [
        'id_status' => $id_s,
        'kasir' => $this->session->userdata('id_karyawan')
      ];

      $this->db->where('id', $id_p);
      $this->db->update('pesanan', $update);
      $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Berhasil Mengubah Status Bayar</div>');
      redirect('kasir/home');
    }
  }

  public function riwayat()
  {
    $data['saya_karyawan'] = $this->db->get_where('karyawan', ['id' => $this->session->userdata('id_karyawan')])->row_array();
    $data['listPesanan'] = $this->KasirModal->getkasirDone()->result_array();

    $this->load->view('templates/header');
    $this->load->view('templates/slidebar_ks');
    $this->load->view('templates/topbar', $data);
    $this->load->view('kasir/home_ks', $data);
    $this->load->view('templates/footer');
  }


  public function logout()
  {
    $this->session->unset_userdata('id_karyawan');
    $this->session->unset_userdata('role_id');

    $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Berhasil Keluar</div>');
    redirect('kasir');
  }
}
