<g:render template="/includes/admin/header"/>
<g:render template="/includes/admin/bodytop"/>
 
<div id="content">
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff">
	<tr>
		<td id="sidebar" width="149" valign="top" bgcolor="#ffffff">

            <g:render template="/includes/admin/sidebar"/>
            
		</td>
		<td id="scroll" width="8" bgcolor="#bbb">
		<div>
			<a id="arrow" href="#" onclick="javascript:showMenu();" class="arrowleft" title="${message(code:'menu.hide', default:'Hide')}"><span><g:message code="menu.show" default="Show" /></span></a>
		</div>
		</td>
		<td valign="top">
			<div id="main">

			        <g:layoutBody />

			</div>
		</td>
	</tr>
</table>
</div>

<g:render template="/includes/admin/footer"/>

