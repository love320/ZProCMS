/**
 * 弹出层树框插件
 */

(function($) {    
	$.fn.btree = function(options) {  
		  var defaults = { 
			title:'网站栏目结构',
		    url: '' ,
		    btn:'',
		    dialogs:false,
		    value:0,
		    onClick:null
		  };    
		  var opts = $.extend(defaults, options);  
		  
		  var showhtml = '<div><ul id="btreewrap"></ul></div>';
		  var msgdialog;
		  $("#"+opts.btn).click(function(){
				$.getJSON(opts.url,function(json){
					msgdialog = $(showhtml).dialog({title:opts.title,onClose: function() { $(this).dialog("destroy");}});
					
					 $('#btreewrap').tree({data: json, onClick:  function(node, $link) {
				            opts.onClick.call(this,node);
				            msgdialog.dialog("destroy");
				          }
					 });
					    
				});
			    
			});
			
		};
		
})(jQuery); 