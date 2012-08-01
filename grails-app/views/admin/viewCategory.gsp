

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="categories" />
        <title><g:message code="productCategory.show" default="Show ProductCategory" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="productCategory.show" default="Show ProductCategory" /></a>
		</div>

		<g:render template="/includes/admin/message"/>

        <div class="section">
			<div class="sectionHeading"><g:message code="productCategory.show" default="Show ProductCategory" /></div>
			<div class="sectionContent">
                <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="productCategory.name" default="Name" /></td>

                            <td valign="top" class="value">${fieldValue(bean:productCategoryInstance, field:'name')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="productCategory.nameEn" default="English Name" /></td>

                            <td valign="top" class="value">${fieldValue(bean:productCategoryInstance, field:'nameEn')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="productCategory.description" default="Description" /></td>

                            <td valign="top" class="value">${fieldValue(bean:productCategoryInstance, field:'description')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="productCategory.descriptionEn" default="English Description" /></td>

                            <td valign="top" class="value">${fieldValue(bean:productCategoryInstance, field:'descriptionEn')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="productCategory.createdDate" default="Created Date" /></td>

                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd HH:mm" date="${productCategoryInstance.createdDate}"/></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="productCategory.lastModifiedDate" default="Last Modified Date" /></td>

                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd HH:mm" date="${productCategoryInstance.lastModifiedDate}"/></td>

                        </tr>

                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${productCategoryInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="${message(code:'edit', 'default':'Edit')}" action="editCategory" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="removeCategory" value="${message(code:'delete', 'default':'Delete')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
