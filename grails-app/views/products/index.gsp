<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title><g:message code='app.title'/> | <g:message code='app.title.product'/></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:javascript src="jquery/jquery-1.2.6.min.js" />
        <g:javascript src="stuHover.js" />
    </head>
    <body class="products">
    <!-- Start of container -->
    <div id="container">
        <div id="header">
            <div id="header_left"></div>
            <ul id="navbar">
                <li id="nav-home" class="top"><a href="${createLink(controller:'home')}" class="toplink"><gx:tab src="${createLinkTo(dir:'/images/main', file:'menu_home.gif')}" i18n="true" selected="false" alt="${message(code:'app.title.home')}"/></a></li>
                <li id="nav-company" class="top"><a href="${createLink(controller:'company')}" class="toplink"><gx:tab src="${createLinkTo(dir:'/images/main', file:'menu_company.gif')}" i18n="true" selected="false" alt="${message(code:'app.title.company')}"/></a></li>
                <li id="nav-products" class="top"><a href="${createLink(controller:'products')}" class="toplink"><gx:tab src="${createLinkTo(dir:'/images/main', file:'menu_products.gif')}" i18n="true" selected="true" alt="${message(code:'app.title.product')}"/></a>
                    <ul class="sub">
                        <k:productCategories/>
                    </ul>
                </li>
                <li id="nav-null" class="top"><a href="" class="toplink"><span></span></a></li>
                <li id="nav-news" class="top"><a href="${createLink(controller:'news')}" class="toplink"><gx:tab src="${createLinkTo(dir:'/images/main', file:'menu_news.gif')}" i18n="true" selected="false" alt="${message(code:'app.title.news')}"/></a></li>
                <li id="nav-order" class="top"><a href="${createLink(controller:'order')}" class="toplink"><gx:tab src="${createLinkTo(dir:'/images/main', file:'menu_order.gif')}" i18n="true" selected="false" alt="${message(code:'app.title.order')}"/></a></li>
                <li id="nav-contact" class="top"><a href="${createLink(controller:'contact')}" class="toplink"><gx:tab src="${createLinkTo(dir:'/images/main', file:'menu_contact.gif')}" i18n="true" selected="false" alt="${message(code:'app.title.contact')}"/></a></li>
            </ul>
            <div id="header_right"><a href="${createLink(controller:'home', params:[lang:'zh_CN'])}"><span><g:message code='language.chinese'/></span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${createLink(controller:'home', params:[lang:'en'])}"><span><g:message code='language.english'/></span></a></div>
        </div>
        <div id="main">
            <div id="main_left"></div>
            <div id="content">
                <h3 class="pagetitle">
                    <g:if test="${category}">
                        <k:fieldValue bean="${category}" field="name" translate="true"/>
                    </g:if>
                    <g:else>
                        <g:message code="main.products.title"/>
                    </g:else>
                </h3>
                <hr/>
                <div class="productsbox">
                    <ul>
                        <g:render template="/home/product" var="p" collection="${productList}"/>
                    </ul>
                </div>
                <div class="cleared"></div>
                <div style="text-align:center;" class="paginateButtons">
                    <g:paginate total="${totalProductCount}" params="[c:params.c,offset:params.offset,max:params.max]" />
                </div>
            </div>
            <div id="main_right"></div>
        </div> <!-- End of main -->
        <div id="footer">
            <p class="copyright">
                <k:settings code='company.copyright' translate='true'/>
            </p>
        </div> <!-- End of footer -->

        </div> <!-- End of container -->
    </body>
</html>