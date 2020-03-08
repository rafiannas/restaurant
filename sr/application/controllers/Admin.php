<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Admin extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
    $this->load->library('form_validation');
    // $this->load->model('chart_model');
  }

  public function index()
  {
    $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
    $this->form_validation->set_rules('password', 'Password', 'required|trim');

    $data['title'] = 'Login Admin';
    $this->load->view('templates/auth_header', $data);
    $this->load->view('Admin/login_admin');
    $this->load->view('templates/auth_footer');
  }
  public function home()
  {

    $this->load->view('templates/header');
    $this->load->view('templates/slidebar');
    $this->load->view('templates/topbar');
    $this->load->view('kasir/home_ks');
    $this->load->view('templates/footer');
  }
}
