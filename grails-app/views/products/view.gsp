<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title><g:message code='app.title'/> | <g:message code='app.title.product'/> - <k:fieldValue bean="${product}" field="name" translate="true" decode="false"/></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:javascript src="jquery/jquery-1.2.6.min.js" />
        <g:javascript src="jquery/jquery.tabs.js" />
        <g:javascript src="jquery/jquery.slider.js" />
        <g:javascript src="stuHover.js" />
    </head>
    <body class="products product">
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
            <div id="main_left">
                <div id="sidebar">
                    <ul>
                        <li><a id="product-features-tab" href="javascript:void(0);" class="current"><span><g:message code="product.function" default="Function" /></span></a></li>
                        <li><a id="product-specification-tab" href="javascript:void(0);"><span><g:message code="product.specification" default="Specification" /></span></a></li>
                        <li><a id="product-packaging-tab" href="javascript:void(0);"><span><g:message code="product.packaging" default="Packaging" /></span></a></li>
                        <li><a id="product-accessories-tab" href="javascript:void(0);"><span><g:message code="product.accessories" default="Accessories" /></span></a></li>
                    </ul>
                </div>
            </div>
            <div id="content">
                <h3 class="pagetitle"><k:fieldValue bean="${product}" field="name" translate="true" decode="false"/></h3>
                <hr/>
                <div id="product-details">
                    <div id="product-features">
                        <p><k:fieldValue bean="${product}" field="function" translate="true" decode="true"/></p>
                    </div>
                    <div id="product-specification" style="display:none;">
                        <p><k:fieldValue bean="${product}" field="specification" translate="true" decode="true"/></p>
                    </div>
                    <div id="product-packaging" style="display:none;">
                        <p><k:fieldValue bean="${product}" field="packaging" translate="true" decode="true"/></p>
                    </div>
                    <div id="product-accessories" style="display:none;">
                        <p><k:fieldValue bean="${product}" field="accessories" translate="true" decode="true"/></p>
                    </div>
                    <div id="product-certificates" style="display:none;">
                        <p><k:fieldValue bean="${product}" field="certificates" translate="true" decode="true"/></p>
                    </div>
                </div>
                <div id="product-large-image">
                    <g:if test="${fieldValue(bean:product, field:'largeImageUrl')}">
                        <img src="${createLinkTo(dir:'/upload')}/${fieldValue(bean:product, field:'largeImageUrl')}" alt=""/>
                    </g:if>
                </div>
            </div>
            <div id="main_right">
                <div id="product-detail-image">
                    <g:if test="${fieldValue(bean:product, field:'detailImageUrl')}">
                        <img src="${createLinkTo(dir:'/upload')}/${fieldValue(bean:product, field:'detailImageUrl')}" alt=""/>
                    </g:if>
                </div>
            </div>
        </div> <!-- End of main -->
        <div id="footer">
            <div id="slidebox">
                <div id="slidebox-left">
                    <a id="slide-previous-button" href="javascript:void(0);"><img id="slide-arrow-left" src="${createLinkTo(dir:'images/main',file:'slide_arrow_left.gif')}"/></a>
                </div>
                <div id="slidebox-content">
                    <ul>
                    <g:each var="p" in="${otherProducts}">
                        <li><g:link controller="products" action="view" id="${p.model}"><img id="slide-${p.id}" width="75" height="58" src="${createLinkTo(dir:'/upload')}/${p.smallImageUrl}" alt="<k:fieldValue bean='${p}' field='name' translate='true'/>"></g:link></li>
                    </g:each>
                    </ul>
                </div>
                <div id="slidebox-right">
                    <a id="slide-next-button" href="javascript:void(0);"><img id="slide-arrow-right" src="${createLinkTo(dir:'images/main',file:'slide_arrow_right.gif')}"/></a>
                </div>
            </div>
            <div class="cleared"></div>
            <p class="copyright">
                <k:settings code='company.copyright' translate='true'/>
            </p>
        </div> <!-- End of footer -->
    </div>
    </body>
</html>