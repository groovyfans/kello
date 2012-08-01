<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title><g:message code='app.title'/></title>
	<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
	<link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
</head>
<body>
<div id="container">
<div id="flash">
    <div style="float:left;width:234px;height:616px;"><img src="${createLinkTo(dir:'images/main', file:'flash_01.gif')}" alt=""></div>
    <div style="float:right;width:241px;height:616px;"><img src="${createLinkTo(dir:'images/main', file:'flash_03.gif')}" alt=""></div>
    <div style="float:left;width:549px;height:531px;"><img src="${createLinkTo(dir:'images/main', file:'flash_02.gif')}" alt=""></div>
    <div style="float:left;width:549px;height:85px;"><img src="${createLinkTo(dir:'images/main', file:'flash_04.gif')}" alt=""></div>
</div>

<div id="index-languages">
    <a href="${createLink(controller:'home', params:[lang:'zh_CN'])}"><span>中文</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${createLink(controller:'home', params:[lang:'en'])}"><span>English</span></a>
</div>
</div>

<script type="text/javascript" language="javascript">
    setTimeout("window.location.href='${createLink(controller:"home",params:[lang:'en'])}'",3000);
</script>
</body>
</html>