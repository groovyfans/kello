

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="products" />
        <title><g:message code="product.show" default="Show Product" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'ui.tabs.css')}" />
		<g:javascript src="jquery/jquery.ui.core.js" />
		<g:javascript src="jquery/jquery.ui.tabs.js" />
		<g:javascript>
			$(function(){

				$("#product-details > ul").tabs();
			
			});
		</g:javascript>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="product.show" default="Show Product" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>

        <div class="section">
			<div class="sectionHeading"><g:message code="product.show" default="Show Product" /></div>
			<div class="sectionContent">
                <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.category" default="Category" /></td>
                            
                            <td valign="top" class="value"><g:link action="viewCategory" id="${productInstance?.category?.id}">${productInstance?.category?.encodeAsHTML()}</g:link></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.model" default="Model" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:productInstance, field:'model')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.name" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:productInstance, field:'name')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.nameEn" default="English Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:productInstance, field:'nameEn')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.description" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:productInstance, field:'description')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.descriptionEn" default="English Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:productInstance, field:'descriptionEn')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.smallImageUrl" default="Small Image Url" /></td>
                            
                            <td valign="top" class="value">
								<g:if test="${fieldValue(bean:productInstance, field:'smallImageUrl')}">
									<img src="${createLinkTo(dir:'/upload')}/${fieldValue(bean:productInstance, field:'smallImageUrl')}" alt=""/>
								</g:if>
							</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.largeImageUrl" default="Large Image Url" /></td>
                            
                            <td valign="top" class="value">
								<g:if test="${fieldValue(bean:productInstance, field:'largeImageUrl')}">
									<img src="${createLinkTo(dir:'/upload')}/${fieldValue(bean:productInstance, field:'largeImageUrl')}" alt=""/>
								</g:if>
							</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.detailImageUrl" default="Detail Image Url" /></td>
                            
                            <td valign="top" class="value">
								<g:if test="${fieldValue(bean:productInstance, field:'detailImageUrl')}">
									<img src="${createLinkTo(dir:'/upload')}/${fieldValue(bean:productInstance, field:'detailImageUrl')}" alt=""/>
								</g:if>
							</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.isNew" default="Is New" /></td>
                            
                            <td valign="top" class="value">
								<g:if test="${productInstance.isNew}">
									<g:message code="yes" default="Yes"/>
								</g:if>
								<g:else>
									<g:message code="no" default="No"/>
								</g:else>
							</td>
                            
                        </tr>
						
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.sequence" default="Sequence" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:productInstance, field:'sequence')}</td>
                            
                        </tr>
						
                        <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="features"><g:message code="product.features" default="Features" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'features','errors')}">
						<div id="product-details">

							<ul>
								<li><a href="#product-function"><span><g:message code="product.function" default="Function" /></span></a></li>
								<li><a href="#product-specification"><span><g:message code="product.specification" default="Specification" /></span></a></li>
								<li><a href="#product-packaging"><span><g:message code="product.packaging" default="Packaging" /></span></a></li>
								<li><a href="#product-accessories"><span><g:message code="product.accessories" default="Accessories" /></span></a></li>
								<li><a href="#product-certificates"><span><g:message code="product.certificates" default="Certificates" /></span></a></li>
							</ul>
 							<div id="product-function">
								<p>
                                <ul style="list-style:none;">
                                    <li><label for="function"><g:message code="product.description" default="Function Chinese Description" /></label></li>
                                
                                    <li>
										${productInstance?.function?.decodeHTML()}
									</li>
                                </ul>
                                <ul style="list-style:none;">
                                    <li><label for="functionEn"><g:message code="product.descriptionEn" default="Function English Description" /></label></li>
                                
                                    <li>
										${productInstance?.functionEn?.decodeHTML()}
									</li>
                                </ul>
								</p>
							</div>
							<div id="product-specification">
								<p>
                                <ul style="list-style:none;">
                                    <li><label for="specification"><g:message code="product.description" default="Specification" /></label></li>
                                
                                    <li>
										${productInstance?.specification?.decodeHTML()}
									</li>
                                </ul>
                                <ul style="list-style:none;">
                                    <li><label for="specificationEn"><g:message code="product.descriptionEn" default="English Specification" /></label></li>
                                
                                    <li>
										${productInstance?.specificationEn?.decodeHTML()}
									</li>
                                </ul>
								</p>
							</div>
							<div id="product-packaging">
								<p>
                                <ul style="list-style:none;">
                                    <li><label for="packaging"><g:message code="product.description" default="Packaging" /></label></li>
                                
                                    <li>
										${productInstance?.packaging?.decodeHTML()}
									</li>
                                </ul>
                                <ul style="list-style:none;">
                                    <li><label for="packagingEn"><g:message code="product.descriptionEn" default="English Packaging" /></label></li>
                                
                                    <li>
										${productInstance?.packagingEn?.decodeHTML()}
									</li>
                                </ul>
								</p>
							</div>
							<div id="product-accessories">
								<p>
                                <ul style="list-style:none;">
                                    <li><label for="accessories"><g:message code="product.description" default="Accessories" /></label></li>
                                
                                    <li>
										${productInstance?.accessories?.decodeHTML()}
									</li>
                                </ul>
                                <ul style="list-style:none;">
                                    <li><label for="accessoriesEn"><g:message code="product.descriptionEn" default="English Accessories" /></label></li>
                                
                                    <li>
										${productInstance?.accessoriesEn?.decodeHTML()}
									</li>
                                </ul>
								</p>
							</div>
							<div id="product-certificates">
								<p>
                                <ul style="list-style:none;">
                                    <li><label for="certificates"><g:message code="product.description" default="Certificates" /></label></li>
                                
                                    <li>
										${productInstance?.certificates?.decodeHTML()}
									</li>
                                </ul>
                                <ul style="list-style:none;">
                                    <li><label for="certificatesEn"><g:message code="product.descriptionEn" default="English Certificates" /></label></li>
                                
                                    <li>
										${productInstance?.certificatesEn?.decodeHTML()}
									</li>
                                </ul>
								</p>
							</div>
                                </td>
                        </tr>

                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.createdByUserLogin" default="Created By User Login" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:productInstance, field:'createdByUserLogin')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.createdDate" default="Created Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd HH:mm" date="${productInstance.createdDate}"/></td>
                            
                        </tr>

                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.lastModifiedByUserLogin" default="Last Modified By User Login" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:productInstance, field:'lastModifiedByUserLogin')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="product.lastModifiedDate" default="Last Modified Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd HH:mm" date="${productInstance.lastModifiedDate}"/></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${productInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="${message(code:'edit', 'default':'Edit')}" action="editProduct" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="removeProduct" value="${message(code:'delete', 'default':'Delete')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
