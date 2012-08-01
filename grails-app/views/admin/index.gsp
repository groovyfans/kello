

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title><g:message code="admin.index" default="Admin Index" /></title>         
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link>
		</div>

		<div class="section">
			<div class="sectionHeading"><g:message code="admin.index" default="Admin Index" /></div>
			<div class="sectionContent">
            <g:form action="index" method="get" >
                    <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="name"><g:message code="admin.current_user" default="Current Login User" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:loggedInUserInfo field="username"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="name"><g:message code="user.role" default="Role" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:ifAllGranted role="ROLE_SUPERVISOR">
                                        <g:message code="user.role.supervisor" default="Supervisor" />
                                    </g:ifAllGranted>
                                    <g:ifAllGranted role="ROLE_ADMIN">
                                        <g:message code="user.role.admin" default="Admin" />
                                    </g:ifAllGranted>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
            </g:form>
			</div>
		</div>
    </body>
</html>
