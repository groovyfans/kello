

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="currentNews" />
        <title><g:message code="news.current" default="Current News" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="news.current" default="Current News" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>

		<div class="section">
			<div class="sectionHeading"><g:message code="news.current" default="Current News" /></div>
			<div class="sectionContent">
            <g:form method="post" >
                 <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="currentNews"><g:message code="news.current" default="Current News" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <fckeditor:editor name="currentNews" width="80%" height="400" toolbar="Standard" fileBrowser="default">
										<k:settings code="news.currentNews" translate="false"/>
									</fckeditor:editor>
                                </td>
                            </tr> 

                        </tbody>
				        <tfoot>
					        <tr>
						        <td colspan="2">
                    <span class="button"><g:actionSubmit class="save" value="${message(code:'updateCurrentNews', 'default':'Update Current News')}" action="saveCurrentNews" /></span>
         					    </td>
						    </tr>
				        </tfoot>
                 </table>
            </g:form>
			</div>
        </div>
    </body>
</html>
