CMS = {
	ext: {},
	decorate: function($ctx){
		for (var key in CMS.ext) {
			if(typeof CMS.ext[key].decorate == 'function'){
				console.log('Invoking decorate for '+key);
				CMS.ext[key].decorate($ctx);
			}
		}
	},
	init: function(){
		for (var key in CMS.ext) {
			if(typeof CMS.ext[key].init == 'function'){
				console.log('Invoking init for '+key);
				CMS.ext[key].init();
			}
		}
		CMS.decorate($(document));
	},
	ui: {
		alert: function(level, message){
			$alert = $('<div class="alert alert-'+level+'">'+message+'</div>');
			$('.main').prepend($alert);
			setTimeout(function(){
				$alert.remove();
			}, 10000);
			window.scrollTo(0, 0);
		},
		confirmMessage: function(title, message, cb){
			$('.modal').modal('hide');
			var $modal = $('<div class="modal fade" role="dialog"><div class="modal-dialog"><div class="modal-content"><div class="modal-body"></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-check"></i></button></div></div></div></div>');
			$('body').append($modal);
			$modal.find('.modal-body').html(title+': '+message);
			$modal.modal('show');
			CMS.decorate($modal);
			$modal.on('hidden.bs.modal', function(){
				cb();
			});
			return $modal;
		},
		fetchModal: function(title, link, path, complete){
			var $modal = $('<div class="modal fade" role="dialog"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h4 class="modal-title"></h4></div><div class="modal-body"></div></div></div></div>');
			$('body').append($modal);
			$modal.find('.modal-title').html(title);
			$modal.find('.modal-body').load(link + " " +path,function(){
				$modal.modal('show');
				CMS.decorate($modal);
				$modal.find('.btn:contains(Cancel)').click(function(){
					$modal.modal('hide').hide();
					return false;
				});
				complete();
			});
			return $modal;
		}
	},
	util: {
	}
}

//support links which fetch HTML and display a modal
CMS.ext['fetch-modal'] = {
	decorate : function($ctx){
		$ctx.find('a.fetch-html-modal').click(function(){
			var $link = $(this);
			$link.attr('disabled', 'disabled');
			CMS.ui.fetchModal($link.attr('data-title'), encodeURI($link.attr('href')), $link.attr('data-path'), function(){
				$link.removeAttr('disabled');
			});
			return false;
		});
	}
}

CMS.ext['richtext'] = {
	decorate: function($ctx){
		$ctx.find('.richtext').summernote({
		    height: 200
		});
	}
}

CMS.ext['slingform'] = {
	decorate: function($ctx){
		$ctx.find('.slingform').submit(function(){
			if($('#cms--autoname').length > 0){
				var name = $('select[name="sling:resourceType"]').val();
				name = name.substr(name.lastIndexOf('/')+1);
				$('#cms--autoname').val(name);
			}
			
			$form = $(this);
			var jcrcontent = false;
			$form.find('input').each(function(idx,inp){
				if(inp.name.indexOf('jcr:content') != -1){
					jcrcontent = true;
				}
			});
			if(jcrcontent){
				$form.append('<input type="hidden" name="jcr:content/jcr:lastModified" />');
				$form.append('<input type="hidden" name="jcr:content/jcr:lastModifiedBy" />');
				$form.append('<input type="hidden" name="jcr:content/jcr:created" />');
				$form.append('<input type="hidden" name="jcr:content/jcr:createdBy" />');
			} else {
				$form.append('<input type="hidden" name="jcr:lastModified" />');
				$form.append('<input type="hidden" name="jcr:lastModifiedBy" />');
				$form.append('<input type="hidden" name="jcr:created" />');
				$form.append('<input type="hidden" name="jcr:createdBy" />');
			}
			$.ajax({
				url: $form.attr('action'),
				type: 'POST',
				data: new FormData(this),
				processData: false,
				contentType: false,
				dataType: 'json',
				success: function(res,msg){
					CMS.ui.confirmMessage(msg, res.title,function(){
						if(window.self !== window.top){
							window.top.location.reload();
						} else {
							location.reload();
						}
					});
				},
				error: function(xhr, msg, err){
					CMS.ui.confirmMessage(msg, err, function(){
					});
				}
			});
			return false;
		});
	}
}

$(document).ready(function() {
	CMS.init();
});
