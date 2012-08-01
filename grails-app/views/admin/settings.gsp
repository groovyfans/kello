

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="settings" />
        <title><g:message code="settings.edit" default="Settings" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="settings.edit" default="Settings" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>

		<div class="section">
			<div class="sectionHeading"><g:message code="settings.edit" default="Settings" /></div>
			<div class="sectionContent">
            <g:form method="post" >
                 <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="companyName_zh_CN"><g:message code="settings.company.name_zh_CN" default="Company Name" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <input type="text" size="50" name="companyName_zh_CN" value="<k:settings code='company.name_zh_CN' translate='false'/>"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="companyName_en"><g:message code="settings.company.name_en" default="Company Name" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <input type="text" size="50" name="companyName_en" value="<k:settings code='company.name_en' translate='false'/>"/>
                                </td>
                            </tr> 
                        
						    <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="companyDescription_zh_CN"><g:message code="settings.company.description_zh_CN" default="Company Description" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <fckeditor:editor name="companyDescription_zh_CN" width="80%" height="300" toolbar="Basic" fileBrowser="default">
										<k:settings code="company.description_zh_CN" translate="false"/>
									</fckeditor:editor>
                                </td>
                            </tr> 
						    
							<tr class="prop">
                                <td valign="top" class="label">
                                    <label for="companyDescription_en"><g:message code="settings.company.description_en" default="Company Description English" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <fckeditor:editor name="companyDescription_en" width="80%" height="300" toolbar="Basic" fileBrowser="default">
										<k:settings code="company.description_en" translate="false"/>
									</fckeditor:editor>
                                </td>
                            </tr> 

						    <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="companyContacts_zh_CN"><g:message code="settings.company.contacts_zh_CN" default="Company Contacts" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <fckeditor:editor name="companyContacts_zh_CN" width="80%" height="200" toolbar="Basic" fileBrowser="default">
										<k:settings code="company.contacts_zh_CN" translate="false"/>
									</fckeditor:editor>
                                </td>
                            </tr> 

						    <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="companyContacts_en"><g:message code="settings.company.contacts_en" default="Company Contacts" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <fckeditor:editor name="companyContacts_en" width="80%" height="200" toolbar="Basic" fileBrowser="default">
										<k:settings code="company.contacts_en" translate="false"/>
									</fckeditor:editor>
                                </td>
                            </tr> 
                            
						    <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="companyCopyright_zh_CN"><g:message code="settings.company.copyright_zh_CN" default="Company Copyright" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <fckeditor:editor name="companyCopyright_zh_CN" width="80%" height="200" toolbar="Basic" fileBrowser="default">
										<k:settings code="company.copyright_zh_CN" translate="false"/>
									</fckeditor:editor>
                                </td>
                            </tr> 

						    <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="companyCopyright_en"><g:message code="settings.company.copyright_en" default="Company Copyright" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <fckeditor:editor name="companyCopyright_en" width="80%" height="200" toolbar="Basic" fileBrowser="default">
										<k:settings code="company.copyright_en" translate="false"/>
									</fckeditor:editor>
                                </td>
                            </tr> 
                        </tbody>
				        <tfoot>
					        <tr>
						        <td colspan="2">
								<div class="buttons">
                    <span class="button"><g:actionSubmit class="save" style="width:100px;" value="${message(code:'update', 'default':'Update')}" action="saveSettings" /></span>
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
