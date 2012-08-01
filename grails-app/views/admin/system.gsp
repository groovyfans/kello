

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="system" />
        <title><g:message code="system.show" default="Show System Info" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="system.show" default="System Info" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>

        <div class="section">
			<div class="sectionHeading"><g:message code="system.show" default="System Info" /></div>
			<div class="sectionContent">
                <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="system.app.name" default="Application Name" /></td>
                            
                            <td valign="top" class="value"><g:meta name="app.name" default="Hello Kello" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="system.app.version" default="Application Version" /></td>
                            
                            <td valign="top" class="value"><g:meta name="app.version" default="1.0" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="system.java.version" default="Java Version" /></td>
                            
                            <td valign="top" class="value"><%= System.properties['java.version']%> - <%= System.properties['java.vendor']%></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="system.server.name" default="Sever Name" /></td>
                            
                            <td valign="top" class="value"><k:serverInfo/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="system.os.name" default="OS Name" /></td>
                            
                            <td valign="top" class="value"><%= System.properties['os.name']%></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="system.os.arch" default="OS Arch" /></td>
                            
                            <td valign="top" class="value"><%= System.properties['os.arch']%></td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
