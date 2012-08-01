

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="createAccount" />
        <title><g:message code="user.create" default="Create User" /></title>         
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="user.create" default="Create User" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>
        <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
        </g:hasErrors>
		<div class="section">
			<div class="sectionHeading"><g:message code="user.create" default="Create User" /></div>
			<div class="sectionContent">
            <g:form action="saveAccount" method="post" >
                    <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="label required">
                                    <label for="role"><g:message code="user.role" default="Role" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <select id="role" name="role">
										<option value="supervisor"><g:message code="user.role.supervisor" default="Supervisor" /></option>
										<option value="admin"><g:message code="user.role.admin" default="Administrator" /></option>
									</select>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="label required">
                                    <label for="username"><g:message code="user.username" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'username','errors')}">
                                    <input type="text" id="username" name="username" value="${fieldValue(bean:userInstance,field:'username')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label required">
                                    <label for="userRealName"><g:message code="user.userRealName" default="User Real Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'userRealName','errors')}">
                                    <input type="text" id="userRealName" name="userRealName" value="${fieldValue(bean:userInstance,field:'userRealName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label required">
                                    <label for="password"><g:message code="user.password" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'password','errors')}">
                                    <input type="password" name="password" id="password" value="${fieldValue(bean:userInstance,field:'password')}" />
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="label required">
                                    <label for="passwordConfirm"><g:message code="user.passwordConfirm" default="PasswordConfirm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'password','errors')}">
                                    <input type="password" name="passwordConfirm" id="passwordConfirm" value="${fieldValue(bean:userInstance,field:'passwordConfirm')}" />
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="description"><g:message code="user.description" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'description','errors')}">
                                     <input type="text" size="30" id="description" name="description" value="${fieldValue(bean:userInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="email"><g:message code="user.email" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'email','errors')}">
                                    <input type="text" size="30" id="email" name="email" value="${fieldValue(bean:userInstance,field:'email')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
				        <tfoot>
					        <tr>
						        <td colspan="2">
								<div class="buttons">
									<span class="button"><input class="save" style="width:100px;" type="submit" value="${message(code:'create', 'default':'Create')}" /></span>
								</div>
							    </td>
						    </tr>
				        </tfoot>
                    </table>
            </g:form>
			</div>
		</div>
    </body>
</html>
