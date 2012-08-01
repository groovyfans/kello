<html>
    <head>
        <title><g:message code='app.title.home'/></title>
        <meta name="layout" content="main" />
        <meta name="tab" content="home" />
    </head>
    <body class="home">
        <div id="main_left"></div>
        <div id="content">
            <h3 class="pagetitle"><k:fieldValue bean='${category}' field='name' translate='true'/></h3>
            <hr/>
            <div class="productsbox">
                <ul>
                    <g:render template="product" var="p" collection="${productList}"/>
                </ul>
            </div>
            <div class="cleared"></div>
            <h3 class="pagetitle"><g:message code="main.home.title2"/></h3>
            <hr/>
            <div class="productsbox">
                <ul>
                    <g:render template="product" var="p" collection="${otherProductList}"/>
                </ul>
            </div>
        </div>
        <div id="main_right">
            <div id="orderLink" style="position:relative;top:370px;">
                <g:link controller="order" action="add"><img src="${createLinkTo(dir:'images/main',file:'order.gif')}" width="174" height="72" alt="Order Online"></g:link>
            </div>
        </div>
    </body>
</html>