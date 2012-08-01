

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="messages" />
        <title><g:message code="guestBook.show" default="Show GuestBook" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="guestBook.show" default="Show GuestBook" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>

        <div class="section">
			<div class="sectionHeading"><g:message code="guestBook.show" default="Show GuestBook" /></div>
			<div class="sectionContent">
                <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="guestBook.id" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:guestBookInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="guestBook.author" default="Author" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:guestBookInstance, field:'author')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="guestBook.address" default="Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:guestBookInstance, field:'address')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="guestBook.companyName" default="Company Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:guestBookInstance, field:'companyName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="guestBook.companyAddress" default="Company Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:guestBookInstance, field:'companyAddress')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="guestBook.telephone" default="Telephone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:guestBookInstance, field:'telephone')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="guestBook.email" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:guestBookInstance, field:'email')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="guestBook.content" default="Content" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:guestBookInstance, field:'content')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="guestBook.createdDate" default="Created Date" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:guestBookInstance, field:'createdDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="guestBook.fax" default="Fax" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:guestBookInstance, field:'fax')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="guestBook.postalCode" default="Postal Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:guestBookInstance, field:'postalCode')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${guestBookInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="${message(code:'edit', 'default':'Edit')}" action="editGuestBook" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="removeGuestBook" value="${message(code:'delete', 'default':'Delete')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
