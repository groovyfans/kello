<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
		<meta name="tab" content="news" />
        <title><g:message code="news.show" default="Show News" /></title>
    </head>
    <body class="news">
        <div id="main_left"></div>
        <div id="content">
            <h3 class="pagetitle">${news.title}</h3>
            <div class="news-details">
                <span class="news-post"><g:message code="news.created.at" default="Post at:"/></span>
                <span class="post-date"><g:formatDate format="yyyy-MM-dd HH:mm" date="${news.createdDate}"/></span>
                <div class="news-content">
                    <p>${news.content.decodeHTML()}</p>
                </div>
            </div>
        </div>
        <div id="main_right"></div>
    </body>
</html>
