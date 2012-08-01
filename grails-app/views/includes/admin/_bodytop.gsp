    <body id="page" class="admin">
        <div id="container">
            <div id="header">
                <div id="banner">
		    <div id="header-logo"><a href="${createLink(controller:'admin')}"><img src="${createLinkTo(dir:'images/admin',file:'header-logo.gif')}"></a></div>
		    <div id="header-title"><img src="${createLinkTo(dir:'images/admin',file:'header-title.gif')}"></div>
                </div>
                <div id="version"><span><g:meta name="app.version"/></span></div>
				<div id="tabs">
					<ul>
						<g:isLoggedIn>
						<li><g:link controller="home" action="index"><g:message code="admin.viewsite" default="Site"/></g:link></li>
						<li><g:link controller="admin" action="changePassword"><g:message code="admin.changePassword" default="Change Password"/></g:link></li>
						<li><g:link controller="logout"><g:message code="admin.logout" default="Logout"/></g:link></li>
						</g:isLoggedIn>
					</ul>
				</div>
            </div>
