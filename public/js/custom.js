$(document).ready(function() {   
            var sideslider = $('[data-toggle=collapse-side]');
            var sel = sideslider.attr('data-target');
            var sel2 = sideslider.attr('data-target-2');
            sideslider.click(function(event){
                $(sel).toggleClass('in');
                $(sel2).toggleClass('out');
            });
			
			$('.navbar li').click(function(e) {
			    $('.navbar li.active').removeClass('active');
			    var $this = $(this);
			    if (!$this.hasClass('active')) {
			        $this.addClass('active');
			    }
			});
			
			$("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
			        e.preventDefault();
			        $(this).siblings('a.active').removeClass("active");
			        $(this).addClass("active");
			        var index = $(this).index();
			        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
			        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
			    });


});
		
		
		
		
