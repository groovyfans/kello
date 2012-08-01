

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="popup" />
        <title><g:message code="attachment.select" default="Select Picture" /></title>
        
<g:javascript>
function select(value)
{
    if (window.opener && window.opener.open && !window.opener.closed) {
        var openerForm = opener.document.forms['${params['form']}'];
        var openerEl = openerForm.elements['${params['element']}'];
        openerEl.value = value;
        var openerImg = opener.document.getElementById('${params['element']}Preview');
        openerImg.setAttribute("src", "${createLinkTo(dir:'/upload')}" + "/" + value);
        openerImg.style.display = "block";
        window.close();
    }
}
</g:javascript>

    </head>
    <body>

		<div class="section">
			<div class="sectionHeading"><g:message code="attachment.select" default="Select Picture" /></div>
			<div class="sectionContent">
			<g:form action="selectImage" method="get" >
            <g:hiddenField name="form" value="${params['form']}" />
            <g:hiddenField name="element" value="${params['element']}" />
			<table class="defaultTable" summary="Attachment List">
				<thead>
					<tr>

						<g:sortableColumn property="fileName" titleKey="attachment.fileName" />
						<th><g:message code="attachment.preview" default="Preview" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${attachmentInstanceList}" status="i" var="attachmentInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
						<td>${fieldValue(bean:attachmentInstance, field:'fileName')}</td>
						<td>
							<a href="#" onclick="select('${fieldValue(bean:attachmentInstance, field:'fileName')}');"><img src="${createLinkTo(dir:'/upload')}/${fieldValue(bean:attachmentInstance, field:'fileName')}" alt="${fieldValue(bean:attachmentInstance, field:'fileName')}" width="64" height="64"/></a>
						</td>
					</tr>
				</g:each>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<div class="paginateButtons">
								<g:paginate params="${params}" total="${Attachment.count()}" />
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
