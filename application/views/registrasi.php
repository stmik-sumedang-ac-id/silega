		 <div class="container">
		 	<h2>Registrasi Aplikasi Legalisir</h2>
			 <form class="form-horizontal" role="form" action="<?php echo base_url('registrasi/post')?>" method="post">
			 	<div class="panel panel-info">
				 <div class="panel-heading">Digunakan untuk login</div>
  				 <div class="panel-body">
				 	<div class="form-group">
					    <label for="ijazah" class="col-sm-2 control-label">Nomor ijazah</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" name="no_ijazah" id="no_ijazah" placeholder="Nomor ijazah" value="<?php echo set_value('ijazah')?>"/>
					    </div>
						<div class="col-sm-5"><?php echo form_error('ijazah'); ?></div>
					</div>
			  		<div class="form-group">
				     	<label for="pass" class="col-sm-2 control-label">Password</label>
					    <div class="col-sm-5">
					      <input type="password" name="pass" class="form-control" id="pass" placeholder="Password">
					    </div>
						<div class="col-sm-5"><?php echo form_error('pass'); ?></div>
					</div> 
				  <div class="form-group">
				    <label for="pass2" class="col-sm-2 control-label">Konfirmasi password</label>
				    <div class="col-sm-5">
				      <input type="password" name="pass2" class="form-control" id="pass2" placeholder="Ulangi password">
				    </div>
					<div class="col-sm-5"><?php echo form_error('pass2'); ?></div>
				  </div>				  
				 </div>
				</div>
				
			  <div class="form-group">
			    <label for="nim" class="col-sm-2 control-label">NIM</label>
			    <div class="col-sm-2">
			      <input type="text" class="form-control" name="nim" id="nim" placeholder="NIM" value="<?php echo set_value('nim')?>"/>
			    </div>
				<div class="col-sm-offset-3 col-sm-5"><?php echo form_error('nim'); ?></div>
			  </div>		   	
			  <div class="form-group">
			    <label for="prodi" class="col-sm-2 control-label">Program studi</label>
			    <div class="col-sm-5">
			      <select name="prodi" id="prodi" class="form-control">
				  	<?php foreach($jurusan->result() as $prodi):?>
				  	<option value="<?php echo $prodi->nama_jurusan; ?>"><?php echo $prodi->nama_jurusan; ?></option>
					<?php endforeach;?>
				  </select>
			    </div>
				<div class="col-sm-5"><?php echo form_error('prodi'); ?></div>
			  </div>
			  <div class="form-group">
			    <label for="nama" class="col-sm-2 control-label">Nama lengkap</label>
			    <div class="col-sm-5">
			      <input type="text" name="nama" class="form-control" id="nama" placeholder="Nama lengkap" value="<?php echo set_value('nama')?>"/>
			    </div>
				<div class="col-sm-5"><?php echo form_error('nama'); ?></div>
			  </div>
			   <div class="form-group">
			    <label for="ttl" class="col-sm-2 control-label">Tanggal lahir</label>
			    <div class="col-sm-2">
			      <input type="text" name="ttl" class="form-control" id="ttl" placeholder="YYYY-mm-dd" value="<?php echo set_value('ttl')?>"/> 
			    </div>
				<div class="col-sm-2">Contoh: 1985-08-21</div>
				<div class="col-sm-offset-3 col-sm-5"><?php echo form_error('ttl'); ?></div>
			  </div>
			  <div class="form-group">
			    <label for="angkatan" class="col-sm-2 control-label">Tahun masuk</label>
			    <div class="col-sm-2">
			      <input type="text" class="form-control" name="angkatan" id="angkatan" placeholder="YYYY" value="<?php echo set_value('angkatan')?>"/>
			    </div>
				<div class="col-sm-2">Contoh: <?php echo date("Y")-4?> </div>
				<div class="col-sm-offset-3 col-sm-5"><?php echo form_error('angkatan'); ?></div>
			  </div>
			  <div class="form-group">
			    <label for="email" class="col-sm-2 control-label">Email</label>
			    <div class="col-sm-5">
			      <input type="text" class="form-control" name="email" id="email" placeholder="someone@somesite.com" value="<?php echo set_value('email')?>"/>
			    </div>
				<div class="col-sm-5"><?php echo form_error('email'); ?></div>
			  </div>
			  <div class="form-group">
			  <label for="no_hp" class="col-sm-2 control-label">No Telpon</label>
			    <div class="col-sm-5">
			      <input type="text" class="form-control" name="no_hp" id="no_hp" placeholder="+62" value="<?php echo set_value('no_hp')?>"/>
			    </div>
				<div class="col-sm-5"><?php echo form_error('no_hp'); ?></div>
			  </div>
			  
			  <div class="form-group">
			  <label for="Alamat" class="col-sm-2 control-label">Alamat</label>
			    <div class="col-sm-5">
			      <input type="text" class="form-control" name="alamat" id="alamat" placeholder="Alamat Lengkap" value="<?php echo set_value('alamat')?>"/>
			    </div>
				<div class="col-sm-5"><?php echo form_error('alamat'); ?></div>
			  </div>
			 
			  <!-- File Upload Ijazah Belum Terkoneksi dengan database -->
			  <div class="form-group">
			  <label for="ijazah" class="col-sm-2 control-label">ijazah</label>
			  <div class="col-sm-5">
              <input type="file" name="file" name="berkas" />
			  <p class="help-block"><i>only .jpg .png and pdf</i></p>
			  </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-5 col-sm-2">
			      <button type="submit" class="btn btn-primary">Submit registrasi</button>
			    </div>
			  </div>
			</form>
		</div>