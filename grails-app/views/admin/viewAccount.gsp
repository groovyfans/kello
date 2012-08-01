

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="accounts" />
        <title><g:message code="user.show" default="Show User" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="user.show" default="Show User" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>

        <div class="section">
			<div class="sectionHeading"><g:message code="user.show" default="Show User" /></div>
			<div class="sectionContent">
                <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="user.username" default="Username" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'username')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="user.userRealName" default="User Real Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'userRealName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="user.authorities" default="Authorities" /></td>
                            
                            <td valign="top" class="value"><k:isSupervisor user="${userInstance}"><g:message code="user.role.supervisor"/></k:isSupervisor>
							<k:isAdmin user="${userInstance}"><g:message code="user.role.admin"/></k:isAdmin></td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="user.description" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'description')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="user.email" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'email')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
			<div class="buttons">
				<g:form>
					<input type="hidden" name="id" value="${userInstance?.id}" />
					<span class="button"><g:actionSubmit class="edit" value="${message(code:'user.setPassword', 'default':'Set Password')}" action="setPassword" /></span>
					<span class="button"><g:actionSubmit class="edit" value="${message(code:'edit', 'default':'Edit')}" action="editAccount" /></span>
					<span class="button"><g:actionSubmit class="delete" onclick="return confirm('${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="removeAccount" value="${message(code:'delete', 'default':'Delete')}" /></span>
				</g:form>
			</div>
        </div>
    </body>
</html>
