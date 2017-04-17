if(!window.CMSEditor){
	window.CMSEditor = {
		init: function(){
			$(".cms--edit-button[data-cms-action=add]").click(function(){
				CMSEditor.ui.showModal('/admin/editor/add.html'+$(this).attr('data-cms-path')+'?availabletypes='+$(this).attr('data-cms-available-types'));
			});
			$(".cms--edit-button[data-cms-action=delete]").click(function(){
				CMSEditor.ui.showModal('/admin/editor/delete.html'+$(this).attr('data-cms-path'));
			});
			$(".cms--edit-button[data-cms-action=edit]").click(function(){
				CMSEditor.ui.showModal('/admin/editor/edit.html'+$(this).attr('data-cms-path'));
			});

			$(".cms--edit-button[data-cms-action=editpage]").click(function(){
				CMSEditor.ui.showModal('/admin/editor/edit.html'+$(this).attr('data-cms-path'));
			});
			$(".cms--edit-button[data-cms-action=moveup]").click(function(){
				CMSEditor.ui.showModal('/admin/editor/moveup.html'+$(this).attr('data-cms-path'));
			});
			$(".cms--edit-button[data-cms-action=movedown]").click(function(){
				CMSEditor.ui.showModal('/admin/editor/movedown.html'+$(this).attr('data-cms-path'));
			});
			
			// closing the modal
			$(".cms--modal-close").click(function(){
				CMSEditor.ui.hideModal();
			});
			$(".cms--modal-background").click(function(){
				CMSEditor.ui.hideModal();
			});
			$(document).keypress(function(e){
				if(e.keyCode==27 && popupStatus==1){
					CMSEditor.ui.hideModal();
				} 
			});  
		},
		ui: {
			modalDisplayed: false,
			hideModal: function() {
				if(CMSEditor.ui.modalDisplayed) {
					$(".cms--modal-background").fadeOut("slow");
					$(".cms--modal-box").fadeOut("slow");
					CMSEditor.ui.modalDisplayed = false;
				}
			},
			showModal: function(url){
				if(CMSEditor.ui.modalDisplayed) {
					CMSEditor.ui.hideModal();
				}
				
				// request data for centering
				var windowWidth = document.documentElement.clientWidth;
				var windowHeight = document.documentElement.clientHeight;
				var popupHeight = $(".cms--modal-box").height();
				var popupWidth = $(".cms--modal-box").width();
				
				// centering
				$(".cms--modal-box").css({
					"position": "absolute",
					"top": windowHeight/2-popupHeight/2,
					"left": windowWidth/2-popupWidth/2
				});
				$(".cms--modal-box iframe").attr('src',url);
				$(".cms--modal-background").css({'opacity': '0.6'});
				$(".cms--modal-background").fadeIn("slow");
				$(".cms--modal-box").fadeIn("slow");
				
				CMSEditor.ui.modalDisplayed = true;
			}
		}
	}
	
	if (document.readyState === 'complete') {
		CMSEditor.init();
	} else {
		document.addEventListener('DOMContentLoaded',CMSEditor.init,false);
	}
}