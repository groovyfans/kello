$(function() {
	$("#slide-previous-button").click(function(){slide("prev")});
	$("#slide-next-button").click(function(){slide("next")});
	function slide(dir) {

		var firstImg = $("#slidebox-content>ul>li:first-child");
		var lastImg = $("#slidebox-content>ul>li:last-child");
		switch(dir){
			case "prev":
				firstImg.insertAfter(lastImg);
				break;
			case "next":
				lastImg.insertBefore(firstImg);
				break;
			default:
				break;
		};
	}
});