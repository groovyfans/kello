var isHide = false;
function showMenu() {
	if(isHide){
		isHide = false;
		$("#sidebar").show();
		$("#arrow").attr("title","隐藏菜单列表");
		$("#arrow").removeClass("arrowright");
		$("#arrow").addClass("arrowleft");
	}else{
		isHide = true;
		$("#sidebar").hide();
		$("#sidebar").width(149);
		$("#arrow").attr("title","显示菜单列表");
		$("#arrow").removeClass("arrowleft");
		$("#arrow").addClass("arrowright");
	}
}