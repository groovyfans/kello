

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="attachments" />
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'jquery.lightbox-0.5.css')}" type="text/css"/>
        <g:javascript src="jquery/jquery.lightbox-0.5.js" />
        <title><g:message code="attachment.list" default="Attachment List" /></title>
<g:javascript>
    $(function() {
        $('a.lightbox').lightBox({
        	imageLoading: '${createLinkTo(dir:'images',file:'lightbox-ico-loading.gif')}',
            imageBtnClose: '${createLinkTo(dir:'images',file:'lightbox-btn-close.gif')}',
            imageBtnPrev: '${createLinkTo(dir:'images',file:'lightbox-btn-prev.gif')}',
            imageBtnNext: '${createLinkTo(dir:'images',file:'lightbox-btn-next.gif')}'
        });
    });
</g:javascript>

    </head>
    <body>

		<div class="breadcrumbs">
		<g:message code="current" default="Current: " /><g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;<a href="#"><g:message code="attachment.list" default="Attachment List" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>
        <g:hasErrors bean="${attachmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${attachmentInstance}" as="list" />
            </div>
        </g:hasErrors>
		<div class="section">
			<div class="sectionHeading"><g:message code="attachment.upload" default="Upload Attachment" /></div>
			<div class="sectionContent">
            <g:uploadForm action="saveAttachment" method="post" >
                    <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="label required">
                                    <label for="fileName"><g:message code="attachment.fileName" default="File Name" /></label>
                                </td>
                                <td valign="top" class="value" style="width: 200px;border-right:none;">
                                    <input type="file" id="uploadFile" name="uploadFile" />
                                </td>
						        <td style="border-left:none;">
									<span class="button">
										<input class="save" style="width:100px;" type="submit" value="${message(code:'upload', 'default':'Upload')}" />
									</span>
							    </td>
                            </tr> 
                        
                        </tbody>
                    </table>
            </g:uploadForm>
			</div>
		</div>

		<div class="section">
			<div class="sectionHeading"><g:message code="attachment.list" default="Attachment List" /></div>
			<div class="sectionContent">
			<table class="defaultTable" summary="Attachment List">
				<thead>
					<tr>

						<g:sortableColumn property="fileName" titleKey="attachment.fileName" />
						
						<th><g:message code="attachment.preview" default="Preview" /></th>

						<th><g:message code="attachment.fileSize"/></th>

						<th><g:message code="attachment.contentType"/></th>

						<th><g:message code="attachment.author"/></th>

						<g:sortableColumn property="createdDate" titleKey="attachment.createdDate" />

						<th><g:message code="operation" default="Operation" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${attachmentInstanceList}" status="i" var="attachmentInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

						<td>${fieldValue(bean:attachmentInstance, field:'fileName')}</td>

						<td>
                            <a href="${createLinkTo(dir:'/upload')}/${fieldValue(bean:attachmentInstance, field:'fileName')}" class="lightbox">
                                <img src="${createLinkTo(dir:'/upload')}/${fieldValue(bean:attachmentInstance, field:'fileName')}" alt="${fieldValue(bean:attachmentInstance, field:'fileName')}" width="64" height="64"/>
                            </a>
                        </td>

						<td>${fieldValue(bean:attachmentInstance, field:'fileSize')}</td>

						<td>${fieldValue(bean:attachmentInstance, field:'contentType')}</td>

						<td>${fieldValue(bean:attachmentInstance, field:'author')}</td>

						<td><g:formatDate format="yyyy-MM-dd HH:mm" date="${attachmentInstance.createdDate}"/></td>

						<td><a href="javascript:void(0);" onclick="javascript:showLarge('${attachmentInstance.id}')'"><g:message code="view"/></a> |
						<g:link action="removeAttachment" id="${attachmentInstance.id}"><g:message code="delete"/></g:link></td>
					</tr>
				</g:each>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">
							<div class="paginateButtons">
								<g:paginate total="${Attachment.count()}" />
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
            </div>
        </div>
    </body>
</html>
