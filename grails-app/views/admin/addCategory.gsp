

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="addCategory" />
        <title><g:message code="productCategory.create" default="Create ProductCategory" /></title>
<g:javascript>
function openwindow(element)
{
    var page = "${createLink(controller:'admin',action:'selectImage', params:[form:'categoryForm'])}" + "&element=" + element;
    var vPicWins = window.open(page, 'SelectImage', 'status=yes,resizable=yes,top=100px,left=200px,width=588px,height=600px,scrollbars=yes');
    if(vPicWins) {
        vPicWins.opener = self;
    }
}
</g:javascript>
    </head>
    <body>
		<div class="breadcrumbs">
		<g:message code="current" default="Current: " /><g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;<a href="#"><g:message code="productCategory.create" default="Create ProductCategory" /></a>
		</div>

		<g:render template="/includes/admin/message"/>
        <g:hasErrors bean="${productCategoryInstance}">
            <div class="errors">
                <g:renderErrors bean="${productCategoryInstance}" as="list" />
            </div>
        </g:hasErrors>
		<div class="section">
			<div class="sectionHeading"><g:message code="productCategory.create" default="Create ProductCategory" /></div>
			<div class="sectionContent">
            <g:form name="categoryForm" action="saveCategory" method="post" >
                    <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="label required">
                                    <label for="name"><g:message code="productCategory.name" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productCategoryInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" style="width: 200px;" value="${fieldValue(bean:productCategoryInstance,field:'name')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="nameEn"><g:message code="productCategory.nameEn" default="English Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productCategoryInstance,field:'nameEn','errors')}">
                                    <input type="text" id="nameEn" name="nameEn" style="width: 200px;" value="${fieldValue(bean:productCategoryInstance,field:'nameEn')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="description"><g:message code="productCategory.description" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productCategoryInstance,field:'description','errors')}">
                                    <textarea rows="3" cols="60" name="description">${fieldValue(bean:productCategoryInstance, field:'description')}</textarea>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="descriptionEn"><g:message code="productCategory.descriptionEn" default="English Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productCategoryInstance,field:'descriptionEn','errors')}">
                                    <textarea rows="3" cols="60" name="descriptionEn">${fieldValue(bean:productCategoryInstance, field:'descriptionEn')}</textarea>
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