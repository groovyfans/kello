    <ul id="navbar">
        <li id="nav-home" class="top"><a href="${createLink(controller:'home')}" class="toplink ${pageProperty(name:'meta.tab')=='home'?'current':''}"><gx:tab src="${createLinkTo(dir:'/images/main', file:'menu_home.gif')}" i18n="true" selected="${pageProperty(name:'meta.tab')=='home'}" alt="${message(code:'app.title.home')}"/></a></li>
        <li id="nav-company" class="top"><a href="${createLink(controller:'company')}" class="toplink ${pageProperty(name:'meta.tab')=='company'?'current':''}"><gx:tab src="${createLinkTo(dir:'/images/main', file:'menu_company.gif')}" i18n="true" selected="${pageProperty(name:'meta.tab')=='company'}" alt="${message(code:'app.title.company')}"/></a></li>
        <li id="nav-products" class="top"><a href="${createLink(controller:'products')}" class="toplink ${pageProperty(name:'meta.tab')=='products'?'current':''}"><gx:tab src="${createLinkTo(dir:'/images/main', file:'menu_products.gif')}" i18n="true" selected="${pageProperty(name:'meta.tab')=='products'}" alt="${message(code:'app.title.product')}"/></a>
            <ul class="sub">
                <k:productCategories/>
            </ul>
        </li>
        <li id="nav-null" class="top"><a href="" class="toplink"><span></span></a></li>
        <li id="nav-news" class="top"><a href="${createLink(controller:'news')}" class="toplink ${pageProperty(name:'meta.tab')=='news'?'current':''}"><gx:tab src="${createLinkTo(dir:'/images/main', file:'menu_news.gif')}" i18n="true" selected="${pageProperty(name:'meta.tab')=='news'}" alt="${message(code:'app.title.news')}"/></a></li>
        <li id="nav-order" class="top"><a href="${createLink(controller:'order')}" class="toplink ${pageProperty(name:'meta.tab')=='order'?'current':''}"><gx:tab src="${createLinkTo(dir:'/images/main', file:'menu_order.gif')}" i18n="true" selected="${pageProperty(name:'meta.tab')=='order'}" alt="${message(code:'app.title.order')}"/></a></li>
        <li id="nav-contact" class="top"><a href="${createLink(controller:'contact')}" class="toplink ${pageProperty(name:'meta.tab')=='contact'?'current':''}"><gx:tab src="${createLinkTo(dir:'/images/main', file:'menu_contact.gif')}" i18n="true" selected="${pageProperty(name:'meta.tab')=='contact'}" alt="${message(code:'app.title.contact')}"/></a></li>
    </ul>
