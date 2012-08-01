

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="accounts" />
        <title><g:message code="user.setPassword" default="Set Password" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="user.setPassword" default="Set Password" /></a>	
		</div>

		<g:render template="/includes/admin/error"/>
        <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
        </g:hasErrors>

		<div class="section">
			<div class="sectionHeading"><g:message code="user.setPassword" default="Set Password" /></div>
			<div class="sectionContent">
            <g:form method="post" >
                 <input type="hidden" name="id" value="${userInstance?.id}" />
                 <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>
							<tr class="prop">
								<td valign="top" class="label"><g:message code="user.username" default="Username" /></td>
								
								<td valign="top" class="value">${fieldValue(bean:userInstance, field:'username')}</td>
								
							</tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="password"><g:message code="user.password" default="Password" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <input type="password" id="password" name="password" value=""/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="passwordConfirm"><g:message code="user.passwordConfirm" default="Confirm Password" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <input type="password" id="passwordConfirm" name="passwordConfirm" value=""/>
                                </td>
                            </tr> 

                        </tbody>
				        <tfoot>
					        <tr>
						        <td colspan="2">
                    <span class="button"><g:actionSubmit class="save" value="${message(code:'update', 'default':'Update')}" action="savePassword" /></span>
							    </td>
						    </tr>
				        </tfoot>
                 </table>
            </g:form>
			</div>
        </div>
    </body>
</html>
