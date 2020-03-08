<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dapur extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
    $this->load->library('form_validation');
    // $this->load->model('chart_model');
    $this->load->model('DapurModal');
  }

  public function index()
  {
    $this->form_validation->set_rules('username', 'Username', 'required|trim');
    $this->form_validation->set_rules('password', 'Password', 'required|trim');


    $data['title'] = 'Login Dapur';

    if ($this->form_validation->run() == false) {

      $this->load->view('templates/auth_header', $data);
      $this->load->view('dapur/login_dapur');
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
          redirect('dapur/home');
        }
        $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Password Salah</div>');
        redirect('dapur');
      } else {
        $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Username Salah</div>');
        redirect('dapur');
      }
    }
  }

  public function home()
  {
    $data['saya_karyawan'] = $this->db->get_where('karyawan', ['id' => $this->session->userdata('id_karyawan')])->row_array();

    $data['listPesanan'] = $this->DapurModal->getDapur()->result_array();

    $this->load->view('templates/header');
    $this->load->view('templates/slidebar_dp');
    $this->load->view('templates/topbar', $data);
    $this->load->view('dapur/home_dp', $data);
    $this->load->view('templates/footer');
  }
  public function detail($id)
  {
    $data['saya_karyawan'] = $this->db->get_where('karyawan', ['id' => $this->session->userdata('id_karyawan')])->row_array();
    $data['rinci'] = $this->DapurModal->getDetail($id)->result_array();

    $this->load->view('templates/header');
    $this->load->view('templates/slidebar_dp');
    $this->load->view('templates/topbar', $data);
    $this->load->view('dapur/detail', $data);
    $this->load->view('templates/footer');
  }
  public function ganti($id)
  {
    $data['saya_karyawan'] = $this->db->get_where('karyawan', ['id' => $this->session->userdata('id_karyawan')])->row_array();
    $data['dipilih'] = $this->DapurModal->getGanti($id)->row_array();
    $data['pilihan'] = $this->db->get('status2')->result_array();

    $this->form_validation->set_rules('id_p', 'Id_p', 'required|trim');
    if ($this->form_validation->run() == false) {

      $this->load->view('templates/header');
      $this->load->view('templates/slidebar_dp');
      $this->load->view('templates/topbar', $data);
      $this->load->view('dapur/ganti', $data);
      $this->load->view('templates/footer');
    } else {
      $id_p = $this->input->post('id_p');
      $id_s = $this->input->post('status2');

      $this->db->set('id_status2', $id_s);
      $this->db->where('id', $id_p);
      $this->db->update('pesanan');
      $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Berhasil Mengubah Status</div>');
      redirect('dapur/home');
    }
  }






  public function logout()
  {
    $this->session->unset_userdata('id_karyawan');
    $this->session->unset_userdata('role_id');

    $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Berhasil Keluar</div>');
    redirect('dapur');
  }
}
