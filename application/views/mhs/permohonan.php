    <div class="container">      
      <div class="row">
	  	<div class="col-sm-6">
        <h3>Membuat permohonan legalisir</h3>
		</div>
	  </div>
	  <div class="row">
	  	<div class="col-sm-9">
			<?php if($this->session->flashdata('msg_warning')):
			echo '<div class="alert alert-warning alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				  <strong>Terjadi kesalahan!</strong> '.$this->session->flashdata('msg_warning').'</div>';
			endif;
			?>
        	<?php echo form_open('mhs/permohonan/confirm')?>
			<table class="table table-striped">
				<tr>
					<th>NIM</th>
					<td colspan="3"><?php echo $this->session->userdata('logged_as')['nim']?></td>
				</tr>
				<tr>
					<th>Nama</th>
					<td colspan="3"><?php echo $this->session->userdata('logged_as')['nama']?></td>
				</tr>
				<tr>
					<th>Program studi</th>
					<td colspan="3"><?php echo $this->session->userdata('logged_as')['prodi']?></td>
				</tr>	
			</table>
			<div class="alert alert-info col-sm-offset-1">
				<p>Bila layanan tidak bisa di gunakan berarti dokumen anda belum terupload di sistem, silahkan hubungi akademik untuk info lebih lanjut</p>
			</div>

			<table class="table table-striped col-sm-offset-1">
				<tr>					
					<th class="col-sm-1">Qty</th>
					<th class="col-sm-5">Permohonan</th>
					<th class="col-sm-1">Biaya</th>
					<th class="col-sm-2">Total</th>
				</tr>
				<?php foreach($layanan->result() as $svc): ?>
				<tr>
					<td>
						<?php if($svc->max_qty==1): ?>
						<input value="1" name="qty_<?php echo $svc->id_layanan ?>" type="checkbox" id="qty_<?php echo $svc->id_layanan ?>" class="form-control"/>
						<?php else: ?>
						<input value="0" name="qty_<?php echo $svc->id_layanan ?>" <?php if(!in_array($svc->id_layanan,$uploaded)) {echo 'disabled';} ?> type="text" id="qty_<?php echo $svc->id_layanan ?>" class="form-control price"/>
						<?php endif; ?>
					</td>
					<td><?php echo $svc->nama_layanan ?></td>
					<td class="tright"><?php echo $this->tools->uang($svc->biaya) ?></td>
					<td class="tright">
						<div class="input-group">
						  <span class="input-group-addon">Rp</span>
							<input dir="rtl" name="price_<?php echo $svc->id_layanan ?>" id="t_<?php echo $svc->id_layanan ?>" value="0" class="form-control" disabled/>
						</div>
					</td>
				</tr>
				<?php endforeach; ?>
				<tr>
					<th class="tright" colspan="3">TOTAL</th>
					<td>
						<div class="input-group">
						  <span class="input-group-addon">Rp</span>
							<input dir="rtl" id="total" value="0" class="form-control" disabled/>
						</div>
					</td>
				</tr>
			</table>
			<table class="table table-striped">			
				<tr>					
					<td colspan="2" class="tright"><button type="submit" class="btn btn-primary">Berikutnya, konfirmasi &raquo;</button></td>
				</tr>
			</table>
			</form>
		</div>
	  </div>
	</div>