<%@include file="/libs/cms/global.jsp"%>
<form action="/etc/config/${site.id}/assets" method="post" class="slingform" enctype="multipart/form-data">
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label for="jcr:content/jcr:title">
					Asset Editor <span class="text-danger">*</span>
				</label>
				<div class="input-group">
					<input type="text" class="form-control" name="editor" value="<c:out value="${properties.editor}" default="/admin/editor/asseteditor" />" required="required" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label for="jcr:content/jcr:title">
					Allowed File Types <span class="text-danger">*</span>
				</label>
				<div class="input-group">
					<input type="text" class="form-control" name="fileTypes" value="<c:out value="${properties.fileTypes}" default="image/*,text/*,application/*" />" required="required" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<button type="submit" class="btn btn-success">
					Save
				</button>
			</div>
		</div>
	</div>
</form>