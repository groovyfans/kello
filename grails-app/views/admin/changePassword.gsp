

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title><g:message code="admin.changePassword" default="Admin Index" /></title>         
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="admin.changePassword" default="Change Password" /></a>	
		</div>

		<g:render template="/includes/admin/error"/>
		<g:render template="/includes/admin/message"/>
		<div class="section">
			<div class="sectionHeading"><g:message code="admin.changePassword" default="Change Password" /></div>
			<div class="sectionContent">
            <g:form method="POST">
                    <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="oldPassword"><g:message code="user.oldPassword" default="Old Password" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <input type="password" name="oldPassword">
                                </td>
							</tr>
							<tr>
                                <td valign="top" class="label">
                                    <label for="newPassword"><g:message code="user.newPassword" default="New Password" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <input type="password" name="newPassword">
                                </td>
							</tr>
							<tr>
                                <td valign="top" class="label">
                                    <label for="confirmPassword"><g:message code="user.confirmPassword" default="Confirm Password" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <input type="password" name="confirmPassword">
                                </td>
							</tr>
                        </tbody>
				        <tfoot>
					        <tr>
						        <td colspan="2">
                    <span class="button"><g:actionSubmit class="save" value="${message(code:'admin.changePassword', 'default':'Change Password')}" action="updatePassword" /></span>
                    <span class="button"><input type="reset" name="clear"/></span>
							    </td>
						    </tr>
				        </tfoot>
                    </table>
            </g:form>
			</div>
		</div>
    </body>
</html>
