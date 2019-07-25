<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('m_mahasiswa','mahasiswa');
		$this->load->model('m_pengajuan','pengajuan');
		$this->load->model('m_pengajuan_detail','pengajuan_detail');
		$this->load->model('m_mailer','mailer');
		
	}
	public function index()
	{
		//Custom query by yysofiyan https://www.codeigniter.com/user_guide/database/queries.html
		//menambakan fungsi escape sting 
		$this->db->escape('nim  = '. $this->session->userdata('logged_as')['nim']);
		$dataq =$this->db->get('mahasiswa')->result();
		
		if (!$dataq[0]->email) {
			$this->load->view('confirm_email');
		} else {
		//end 

		$data['pengajuan'] = $this->pengajuan->getData(array('nim'=>$this->session->userdata('logged_as')['nim']),array('waktu_pengajuan'=>'desc'));
		foreach($data['pengajuan']->result() as $pengajuan)
		{
			$res = $this->pengajuan_detail->getData(array('id_pengajuan'=>$pengajuan->id_pengajuan));
			foreach($res->result() as $detail):				
				$data['detail'][$pengajuan->id_pengajuan][] = $detail;
			endforeach;			
		}
		$this->show_view('mhs/dashboard',$data);
		}
	}
	public function bukti_pembayaran() {
		$id = $this->input->post("aidi");
		if(!$id) {
			echo '<div style="font-family:Helvetica;font-size:250px;text-align:center;">YOU CANT SEE ME</h1>';
		} else {
			$this->db->where('pengajuan.id_pengajuan =' . $id);
			$this->db->join("mahasiswa", "pengajuan.nim = mahasiswa.nim");
			$this->db->join("pembayaran", "pengajuan.id_pengajuan = pembayaran.id_pengajuan");
			$data['data'] = $this->db->get('pengajuan')->result();
			$this->db->where('id_pengajuan =' . $id);
			$data['data_detail'] = $this->db->get('pengajuan_detail')->result();
			$this->load->view('inv',$data);
		}
	}

	public function bukti_permohonan() {
		$id = $this->input->post("aidi");
		if(!$id) {
			echo '<div style="font-family:Helvetica;font-size:250px;text-align:center;">YOU CANT SEE ME</h1>';
		} else {
			$this->db->where('pengajuan.id_pengajuan =' . $id);
			$this->db->join("mahasiswa", "pengajuan.nim = mahasiswa.nim");
			
			$data['data'] = $this->db->get('pengajuan')->result();
			$this->db->where('id_pengajuan =' . $id);
			$data['data_detail'] = $this->db->get('pengajuan_detail')->result();
			$this->load->view('inv',$data);
		}
	}


	public function okeoce() {
		$nim = $this->session->userdata('logged_as')['nim'];
		$data['email'] = $this->input->post("email");

		$this->db->where("nim = ".$nim);
		$this->db->update("mahasiswa",$data);
		redirect('mhs/dashboard','refresh');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */