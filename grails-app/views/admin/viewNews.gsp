

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="news" />
        <title><g:message code="news.show" default="Show News" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="news.show" default="Show News" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>

        <div class="section">
			<div class="sectionHeading"><g:message code="news.show" default="Show News" /></div>
			<div class="sectionContent">
                <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="news.title" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:newsInstance, field:'title')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="news.content" default="Content" /></td>
                            
                            <td valign="top" class="value">${newsInstance?.content?.decodeHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="news.createdByUserLogin" default="Created By User Login" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:newsInstance, field:'createdByUserLogin')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="news.createdDate" default="Created Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd HH:mm" date="${newsInstance.createdDate}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="news.isNew" default="Is New" /></td>
                            
                            <td valign="top" class="value">
								<g:if test="${newsInstance.isNew}">
									<g:message code="yes" default="Yes"/>
								</g:if>
								<g:else>
									<g:message code="no" default="No"/>
								</g:else>
							</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="news.lastModifiedByUserLogin" default="Last Modified By User Login" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:newsInstance, field:'lastModifiedByUserLogin')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="news.lastModifiedDate" default="Last Modified Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd HH:mm" date="${newsInstance.lastModifiedDate}"/></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${newsInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="${message(code:'edit', 'default':'Edit')}" action="editNews" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="removeNews" value="${message(code:'delete', 'default':'Delete')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
