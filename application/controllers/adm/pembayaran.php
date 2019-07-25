<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pembayaran extends MY_Controller {
	function __construct()
	{
		parent::__construct();
		$this->load->model('m_mahasiswa','mahasiswa');
		$this->load->model('m_pengajuan','pengajuan');
		$this->load->model('m_pengajuan_detail','pengajuan_detail');
		$this->load->model('m_pembayaran','pembayaran');
		$this->load->model('m_mailer','mailer');
	}
	
	public function submit_ambil($nim,$id_pengajuan)
	{
		if($nim<>'' && $id_pengajuan<>'')
		{
			$pengajuan = $this->pengajuan->getRowByPks(array($id_pengajuan));
			if(isset($pengajuan->id_pengajuan))
				$this->pengajuan->updateCondition(array('id_pengajuan'=>$pengajuan->id_pengajuan),array('status'=>'4','perubahan_status'=>date('Y-m-d H:i:s')));
		}
		redirect('adm/pembayaran/index','refresh');
	}
	public function submit_selesai($nim,$id_pengajuan)
	{
		if($nim<>'' && $id_pengajuan<>'')
		{
			$pengajuan = $this->pengajuan->getRowByPks(array($id_pengajuan));
			if(isset($pengajuan->id_pengajuan))
				$this->pengajuan->updateCondition(array('id_pengajuan'=>$pengajuan->id_pengajuan),array('status'=>'3','perubahan_status'=>date('Y-m-d H:i:s')));
		}
		redirect('adm/pembayaran/index','refresh');
	}
	public function submit_bayar($nim,$id_pengajuan)
	{
		if($nim<>'' && $id_pengajuan<>'')
		{
			$pengajuan = $this->pengajuan->getRowByPks(array($id_pengajuan));
			$this->pengajuan->updateCondition(array('id_pengajuan'=>$pengajuan->id_pengajuan),array('status'=>'2','perubahan_status'=>date('Y-m-d H:i:s')));	
			
			$data = array();
			$data['id_pengajuan']	=	$pengajuan->id_pengajuan;
			$data['nim']			=	$pengajuan->nim;
			$data['nama']			=	$pengajuan->nama;
			$data['waktu_pengajuan']=	$pengajuan->waktu_pengajuan;
			$data['waktu_bayar']	=	date('Y-m-d H:i:s');
			$data['biaya_total']	=	$this->pengajuan_detail->getTotalTagihan($pengajuan->id_pengajuan);
			$this->pembayaran->save($data);	
		}
		redirect('adm/pembayaran/index','refresh');
//email
			$this->db->where('nim = '. $nim);
			$getemail = $this->db->get('mahasiswa')->result();
			$this->mailer->config();
			$this->email->from('info@stmik-sumedang.ac.id', 'Dokumen Legalisir - STMIK Sumedang');
			$this->email->to($getemail[0]->email ,$getemail[0]->nama);
			$this->email->subject('[Legalisir - STMIK Sumedang] Konfirmasi Pembayaran');

			$this->db->where('id_pengajuan =' . $id_pengajuan);
			$this->db->join("mahasiswa", "pengajuan.nim = mahasiswa.nim");
			$data = $this->db->get('pengajuan')->result();
			$this->db->where('id_pengajuan =' . $id_pengajuan);
			$data_detail = $this->db->get('pengajuan_detail')->result();
			$d = explode(" ",$data[0]->waktu_pengajuan);

			$msg = '<table style="font-family:Helvetica;color:black;" border="0" cellspacing="2" cellpadding="0" width="100%">
<thead>
  <tr>
    <td colspan="4" style="padding:10px;text-align:center;font-weight:bold;color:white;background-color:black;border-radius:5px;">BUKTI PEMBAYARAN</td>
  </tr>
  <tr>
    <td colspan="2" width="50%" style="padding-bottom:40px;padding-top:40px;padding-left:20px;font-size:13px;">'. $data[0]->prodi .'<br>STMIK SUMEDANG</td>
    <td colspan="2"style="text-align:right;"><img src="images/logo-stmik-bw.png" width="80px" style="padding-right:20px"; /></td>
  </tr>
  <tr>
    <td rowspan="2" colspan="2"width="50%" style="padding-bottom:20px;font-weight:bold; font-size:20px;padding-left:20px;padding-top:20px;">'. $data[0]->nama . ' - ' . $data[0]->email .'<br>' . $data[0]->nim .'</td>
    <td><div style="padding:15px;"></div><!-- Blank Space --></td>
    <td><!-- Blank Space --></td>
  </tr>
  <tr style="font-size:75%;">
  <td style="background-color:#dddddd;border-radius:0.25em;border:1px solid #a1a1a1;padding:3px 0px 3px 10px;">
        Tanggal    
  	</td>
    <td style="border-radius:0.25em;border:1px solid #a1a1a1;padding:3px 0px 3px 10px;">
      '. $d[0] .'
    </td>
  </tr>
</thead>

<tbody>
  <tr style="font-size:75%">
    	<th width="25%" style="padding:3px;background-color:#dddddd;border: 1px solid #a1a1a1;border-radius:0.25em;font-size:125%;">Layanan</th>
			<th width="25%" style="padding:3px;background-color:#dddddd;border: 1px solid #a1a1a1;border-radius:0.25em;font-size:125%;">Jumlah</th>
      <th width="25%" style="padding:3px;background-color:#dddddd;border: 1px solid #a1a1a1;border-radius:0.25em;font-size:125%;">Biaya Satuan</th>
      <th width="25%" style="padding:3px;background-color:#dddddd;border: 1px solid #a1a1a1;border-radius:0.25em;font-size:125%;">Subtotal</th>
	</tr>';
 foreach($data_detail as $item):
 	$msg .= '
  <tr>
    	<td style="border-radius:0.25em;border:1px solid #a1a1a1; font-size:75%;padding :3px;">'. $item->nama_layanan .'</td>
			<td style="border-radius:0.25em;border:1px solid #a1a1a1; font-size:75%;padding :3px;">'. $item->jumlah .'</td>
			<td style="border-radius:0.25em;border:1px solid #a1a1a1; font-size:75%;padding :3px;">Rp . '. $this->tools->angka($item->biaya_satuan) .'</td>
			<td style="border-radius:0.25em;border:1px solid #a1a1a1; font-size:75%;padding :3px;">Rp . '.  $this->tools->angka($item->jumlah * $item->biaya_satuan) .'</td>
	</tr>';
endforeach;
$msg .= '
  <tr>
    <td colspan="4" style="padding:20px;"></td>
  </tr>
  <tr>
    <td colspan="2"width="50%"> </td>
    <td style="padding:3px 0px 3px 10px;background-color:#dddddd;font-size:75%;border-radius:0.25em;border:1px solid #a1a1a1;">     
        Total
  	</td>
    <td style="padding:3px 0px 3px 10px;font-size:75%;border-radius:0.25em;border:1px solid #a1a1a1;">
      Rp . '. $this->tools->angka($data[0]->total_tagihan).'
    </td>
  </tr>
  <tr>
    <td colspan="2"width="50%"> </td>
    <td style="padding:3px 0px 3px 10px;background-color:#dddddd;font-size:75%;border-radius:0.25em;border:1px solid #a1a1a1;" >
        Dibayar
  	</td>
    <td style="padding:3px 0px 3px 10px;font-size:75%;border-radius:0.25em;border:1px solid #a1a1a1;">
      Rp . '. $this->tools->angka($data[0]->total_tagihan).'
    </td>
  </tr>
  <tr>
    <td colspan="4" style=";padding:30px 5px 0px 6px;">
      <center>KETERANGAN</center><hr/>
      <p>Pengambilan dilakukan di Kampus STMIK Sumedang pada jam kerja dengan membawa bukti pengajuan yang telah selesai pembayarannya.</p>
    </td>
  </tr>
</tbody>
</table>
<!-- Bones wuz here
    (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧
-->';
			$this->email->set_newline("\r\n");
			$this->email->message($msg);
			if ($this->email->send()) {
					
				} else {
					show_error($this->email->print_debugger());
				}
		}
	
	public function index($filterStatus=1)
	{
		if($filterStatus>0&&$filterStatus<=4):
			$data['pengajuan'] = $this->pengajuan->getData(array('status'=>$filterStatus));					
		else:
			$data['pengajuan'] = $this->pengajuan->getData();
		endif;
		$data['filter'] = $filterStatus;
		foreach($data['pengajuan']->result() as $pengajuan)
		{
			$res = $this->pengajuan_detail->getData(array('id_pengajuan'=>$pengajuan->id_pengajuan));
			foreach($res->result() as $detail):				
				$data['detail'][$pengajuan->id_pengajuan][] = $detail;
			endforeach;			
		}
		
		
		$data['customCssSource'] = array('table_jui.css','smoothness/jquery-ui-1.8.4.custom.css');
		$data['customJsSource'] = array('jquery.js');
		$data['customJsSource'] = array('jquery.dataTables.js');
		$data['customJs'] = '$(document).ready(function() {
				oTable = $(\'#data\').dataTable({
					"sPaginationType": "full_numbers",					
					"aaSorting": [[ 0, "desc" ],[ 6, "asc" ],],
					"oLanguage": {
            			"sUrl": "'.base_url('js/id_ID.txt').'"
					},
					aoColumnDefs: [{
					     bSortable: false,
					     aTargets: [ -1,1,2 ]
					  }]                    
				});				
				
			} );
			';
		
		$this->show_view('adm/pembayaran',$data);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */