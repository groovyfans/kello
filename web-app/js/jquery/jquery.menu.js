$(function() {
	$("#nav-products").hover(
		function(){
			$("ul.sub").show();
		},
		function(){
			$("ul.sub").hide();
		}
	);
});