

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="news" />
        <title><g:message code="news.edit" default="Edit News" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="news.edit" default="Edit News" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>
        <g:hasErrors bean="${newsInstance}">
            <div class="errors">
                <g:renderErrors bean="${newsInstance}" as="list" />
            </div>
        </g:hasErrors>

		<div class="section">
			<div class="sectionHeading"><g:message code="news.edit" default="Edit News" /></div>
			<div class="sectionContent">
            <g:form method="post" >
                 <input type="hidden" name="id" value="${newsInstance?.id}" />
                 <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="label required">
                                    <label for="title"><g:message code="news.title" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'title','errors')}">
                                    <input type="text" id="title" name="title" style="width:300px" value="${fieldValue(bean:newsInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="content"><g:message code="news.content" default="Content" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'content','errors')}">
                                    <fckeditor:editor name="content" width="80%" height="300" toolbar="Standard" fileBrowser="default">
										${newsInstance?.content?.decodeHTML()}
									</fckeditor:editor>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="isNew"><g:message code="news.isNew" default="Is New" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'isNew','errors')}">
                                    <g:checkBox name="isNew" value="${newsInstance?.isNew}" ></g:checkBox>
                                </td>
                            </tr> 

                        </tbody>
				        <tfoot>
					        <tr>
						        <td colspan="2">
								<div class="buttons">
									<span class="button"><g:actionSubmit class="save" style="width:100px;" value="${message(code:'update', 'default':'Update')}" action="updateNews" /></span>
									<span class="button"><g:actionSubmit class="delete" onclick="return confirm('${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="removeNews" value="${message(code:'delete', 'default':'Delete')}" /></span>
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
