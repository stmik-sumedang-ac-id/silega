		 <div class="container">
		 	<h3>Upload dokumen mahasiswa: <?php echo $mhs->nama?></h3>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-striped">
						<tr>
							<th class="col-md-1"><a class="btn btn-danger" href="<?php echo base_url($this->uri->segment(1).'/'.$this->router->fetch_class())?>">&laquo; Kembali</a></th>
							<th class="col-md-2 tright">No. Ijazah: </th>
							<td class="col-md-4"><?php echo $mhs->no_ijazah?></td>							
							<th class="col-md-2 tright">Program studi: </th>
							<td><?php echo $mhs->prodi?></td>
						</tr>
					</table>
				</div>
			</div>
			 
			  <?php foreach($layanan as $l): ?>
			  <form class="form-horizontal" role="form" action="<?php echo base_url($this->uri->segment(1).'/'.$this->router->fetch_class().'/upload_doc')?>" method="post" accept-charset="utf-8" enctype="multipart/form-data">			  
				  <div class="form-group" style="border-bottom: 1px solid #cccccc;padding-bottom: 5px;">
				    
					<label for="nim" class="col-sm-1">
						<?php if(in_array($l->id_layanan,$uploaded)): ?>
						<a class="btn btn-success btn-xs" href="<?php echo base_url($this->uri->segment(1).'/'.$this->router->fetch_class().'/download/'.$l->id_layanan.'/'.$mhs->no_ijazah)?>"><i class="glyphicon glyphicon-download"></i> Download</a> 
						<?php endif; ?>
					</label>
										
				    <label for="nim" class="col-sm-5">Dokumen <?php echo $l->nama_layanan?></label>
				    <div class="col-sm-5">
				      	<div style="position:relative;">
						        <a class='btn btn-primary' href='javascript:;'>
						            Choose File...
						            <input name="filenya" type="file" style='position:absolute;z-index:2;top:0;left:0;filter: alpha(opacity=0);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";opacity:0;background-color:transparent;color:transparent;' name="file_source" size="40"  onchange='$("#upload-file-info-<?php echo $l->id_layanan?>").html($(this).val());'>
									<input type="hidden" name="layanan" value="<?php echo $l->id_layanan?>" />
									<input type="hidden" name="ijazah" value="<?php echo $mhs->no_ijazah?>" />
						        </a>
						        <span class='label label-info' id="upload-file-info-<?php echo $l->id_layanan?>"></span>
						</div>
				    </div>
				  	<div class="col-sm-1">
			      		<button type="submit" class="btn btn-primary">Upload</button>
			    	</div>
			  	</div>				 
			</form>
			<?php endforeach; ?>
		</div>