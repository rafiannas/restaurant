<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class ServerModal extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }

    public function get()
    {
        $q = "SELECT COUNT(id) as jmh FROM user";
        return $this->db->query($q);
    }
    public function getStatusMasak()
    {
        $q = "SELECT * FROM karyawan";
        return $this->db->query($q);
    }
    public function getIkan()
    {
        $q = "SELECT * FROM menu WHERE id_kategori = 2";
        return $this->db->query($q)->result_array();
    }
    public function getAyam()
    {
        $q = "SELECT * FROM menu WHERE id_kategori = 1";
        return $this->db->query($q)->result_array();
    }
    public function getMinuman()
    {
        $q = "SELECT * FROM menu WHERE id_kategori = 3";
        return $this->db->query($q)->result_array();
    }


    //riwayat
    public function riwayat()
    {
        $q = "SELECT * FROM pesanan, karyawan, `status`, `status2` WHERE id_status <> 1
        AND pesanan.server = karyawan.id
        AND pesanan.id_status = `status`.`id`
        AND pesanan.id_status2 = status2.id
        ORDER BY pesanan.id DESC
        ";
        return $this->db->query($q)->result_array();
    }

    public function getKonfirmasi()
    {
        $q = "SELECT * FROM pesanan WHERE id_status = 1   
        ";
        $pesanan = $this->db->query($q)->row_array();
        $id_pesanan = $pesanan['id'];

        $qu = "SELECT * FROM detail_pesanan, menu 
        WHERE id_pesanan = $id_pesanan
        AND detail_pesanan.id_menu = menu.id
        ";
        return $this->db->query($qu)->result_array();
    }
}
