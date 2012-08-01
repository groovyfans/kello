<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <g:render template="/includes/main/meta"/>
        <title><g:message code='app.title'/> | <g:layoutTitle default="${message(code:'app.title.home')}" /></title>
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <g:javascript src="jquery/jquery-1.2.6.min.js" />
        <g:javascript src="stuHover.js" />
        <g:layoutHead />
    </head>

<body class="${pageProperty(name:'body.class')}">

<!-- Start of container -->
<div id="container">
<g:render template="/includes/main/header"/>

<div id="main">
    <g:layoutBody />
</div> <!-- End of main -->

<div id="footer">
    <p class="copyright">
        <k:settings code='company.copyright' translate='true'/>
    </p>
</div> <!-- End of footer -->

</div> <!-- End of container -->
</body>
</html>