<html>
    <head>
        <title><g:message code='app.title.news'/></title>
        <meta name="layout" content="main" />
        <meta name="tab" content="news" />
    <STYLE TYPE="text/css">

    </STYLE>
    </head>
    <body class="news">
        <div id="main_left"></div>
        <div id="content">
            <h3 class="pagetitle"><g:message code='main.news.title'/></h3>
            <hr/>
            <ul class="newsbox">
                <g:each var="n" in="${news}">
                    <li>
                        <g:link action="view" id="${n.id}">
                            <span class="lbt">${n.title}</span>
                            <span class="ldt"><g:formatDate format="yyyy-MM-dd HH:mm" date="${n.createdDate}"/></span>
                        </g:link>
                    </li>
                </g:each>
            </ul>
            <div style="text-align:center;" class="paginateButtons">
                <g:paginate total="${News.count()}" />
            </div>
        </div>
        <div id="main_right"></div>
    </body>
</html>