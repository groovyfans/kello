

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="products" />
        <title><g:message code="product.edit" default="Edit Product" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'ui.tabs.css')}" />
		<g:javascript src="jquery/jquery.ui.core.js" />
		<g:javascript src="jquery/jquery.ui.tabs.js" />
		<g:javascript>
			$(function(){

				$("#product-details > ul").tabs();
			
			});
		</g:javascript>
		<g:javascript>
		function openwindow(element)
		{
			var page = "${createLink(controller:'admin',action:'selectImage', params:[form:'productForm'])}" + "&element=" + element;
			var vPicWins = window.open(page, 'Select Image', 'status=yes,resizable=yes,top=100,left=200,width=588,height=600,scrollbars=yes');
			vPicWins.opener = self;
		}
		function unselectImage(element)
		{
			var form = document.forms['productForm'];
			var image = form.elements[element];
			image.value="";
			var imagePreview = document.getElementById(element+'Preview');
			imagePreview.setAttribute("src", "");
			imagePreview.style.display = "none";
		}
		</g:javascript>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="product.edit" default="Edit Product" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>
        <g:hasErrors bean="${productInstance}">
            <div class="errors">
                <g:renderErrors bean="${productInstance}" as="list" />
            </div>
        </g:hasErrors>

		<div class="section">
			<div class="sectionHeading"><g:message code="product.edit" default="Edit Product" /></div>
			<div class="sectionContent">
            <g:form name="productForm" method="post" >
                 <input type="hidden" name="id" value="${productInstance?.id}" />
                 <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="label required">
                                    <label for="category"><g:message code="product.category" default="Category" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'category','errors')}">
                                    <g:select optionKey="id" from="${ProductCategory.list()}" name="category.id" value="${productInstance?.category?.id}" ></g:select>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label required">
                                    <label for="model"><g:message code="product.model" default="Model" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'model','errors')}">
                                    <input type="text" id="model" name="model" value="${fieldValue(bean:productInstance,field:'model')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label required">
                                    <label for="name"><g:message code="product.name" default="Chinese Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" style="width: 200px;" value="${fieldValue(bean:productInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="nameEn"><g:message code="product.nameEn" default="English Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'nameEn','errors')}">
                                    <input type="text" id="nameEn" name="nameEn" style="width: 200px;" value="${fieldValue(bean:productInstance,field:'nameEn')}"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="description"><g:message code="product.description" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'description','errors')}">
                                    <textarea rows="3" cols="60" name="description">${fieldValue(bean:productInstance, field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="descriptionEn"><g:message code="product.descriptionEn" default="English Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'descriptionEn','errors')}">
                                    <textarea rows="3" cols="60" name="descriptionEn">${fieldValue(bean:productInstance, field:'descriptionEn')}</textarea>
                                </td>
                            </tr> 
							
                            <tr class="prop">
                                <td valign="top" class="label required">
                                    <label for="sequence"><g:message code="product.sequence" default="Sequence" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'sequence','errors')}">
                                    <input type="text" id="sequence" name="sequence" style="width: 60px;" value="${fieldValue(bean:productInstance,field:'sequence')}"/>
                                </td>
                            </tr> 
							
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="smallImageUrl"><g:message code="product.smallImageUrl" default="Small Image Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'smallImageUrl','errors')}">
									<input type="hidden" name="smallImageUrl" value="${productInstance?.smallImageUrl}" />
									<a href="javascript:void(0);" onclick="javascript:openwindow('smallImageUrl');"><g:message code="product.selectImage" default="Select Image" /></a>&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="javascript:unselectImage('smallImageUrl');"><g:message code="product.unselectImage" default="Unselect Image" /></a><br/>
									<g:if test="${fieldValue(bean:productInstance, field:'smallImageUrl')}">
									    <img id="smallImageUrlPreview" src="${createLinkTo(dir:'/upload')}/${fieldValue(bean:productInstance, field:'smallImageUrl')}">
									</g:if>
									<g:else>
									    <img id="smallImageUrlPreview" src="" style="display:none;"/>
								    </g:else>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="largeImageUrl"><g:message code="product.largeImageUrl" default="Large Image Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'largeImageUrl','errors')}">                                
									<input type="hidden" name="largeImageUrl" value="${productInstance?.largeImageUrl}" />
									<a href="javascript:void(0);" onclick="javascript:openwindow('largeImageUrl');"><g:message code="product.selectImage" default="Select Image" /></a>&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="javascript:unselectImage('largeImageUrl');"><g:message code="product.unselectImage" default="Unselect Image" /></a><br/>
									<g:if test="${fieldValue(bean:productInstance, field:'largeImageUrl')}">
									    <img id="largeImageUrlPreview" src="${createLinkTo(dir:'/upload')}/${fieldValue(bean:productInstance, field:'largeImageUrl')}">
									</g:if>
									<g:else>
									    <img id="largeImageUrlPreview" src="" style="display:none;"/>
								    </g:else>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="detailImageUrl"><g:message code="product.detailImageUrl" default="Detail Image Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'detailImageUrl','errors')}">
									<input type="hidden" name="detailImageUrl" value="${productInstance?.detailImageUrl}" />
									<a href="javascript:void(0);" onclick="javascript:openwindow('detailImageUrl');"><g:message code="product.selectImage" default="Select Image" /></a>&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="javascript:unselectImage('detailImageUrl');"><g:message code="product.unselectImage" default="Unselect Image" /></a><br/>
									<g:if test="${fieldValue(bean:productInstance, field:'detailImageUrl')}">
									    <img id="detailImageUrlPreview" src="${createLinkTo(dir:'/upload')}/${fieldValue(bean:productInstance, field:'detailImageUrl')}">
									</g:if>
									<g:else>
									    <img id="detailImageUrlPreview" src="" style="display:none;"/>
								    </g:else>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="isNew"><g:message code="product.isNew" default="Is New" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'isNew','errors')}">
                                    <g:checkBox name="isNew" value="${productInstance?.isNew}" ></g:checkBox>
                                </td>
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
										<fckeditor:editor name="function" width="80%" height="300" toolbar="Standard" fileBrowser="default">
											${productInstance?.function?.decodeHTML()}
										</fckeditor:editor>
									</li>
                                </ul>
                                <ul style="list-style:none;">
                                    <li><label for="functionEn"><g:message code="product.descriptionEn" default="Function English Description" /></label></li>
                                
                                    <li>
										<fckeditor:editor name="functionEn" width="80%" height="300" toolbar="Standard" fileBrowser="default">
											${productInstance?.functionEn?.decodeHTML()}
										</fckeditor:editor>
									</li>
                                </ul>
								</p>
							</div>
							<div id="product-specification">
								<p>
                                <ul style="list-style:none;">
                                    <li><label for="specification"><g:message code="product.description" default="Specification" /></label></li>
                                
                                    <li>
										<fckeditor:editor name="specification" width="80%" height="300" toolbar="Standard" fileBrowser="default">
											${productInstance?.specification?.decodeHTML()}
										</fckeditor:editor>
									</li>
                                </ul>
                                <ul style="list-style:none;">
                                    <li><label for="specificationEn"><g:message code="product.descriptionEn" default="English Specification" /></label></li>
                                
                                    <li>
										<fckeditor:editor name="specificationEn" width="80%" height="300" toolbar="Standard" fileBrowser="default">
											${productInstance?.specificationEn?.decodeHTML()}
										</fckeditor:editor>
									</li>
                                </ul>
								</p>
							</div>
							<div id="product-packaging">
								<p>
                                <ul style="list-style:none;">
                                    <li><label for="packaging"><g:message code="product.description" default="Packaging" /></label></li>
                                
                                    <li>
										<fckeditor:editor name="packaging" width="80%" height="300" toolbar="Standard" fileBrowser="default">
											${productInstance?.packaging?.decodeHTML()}
										</fckeditor:editor>
									</li>
                                </ul>
                                <ul style="list-style:none;">
                                    <li><label for="packagingEn"><g:message code="product.descriptionEn" default="English Packaging" /></label></li>
                                
                                    <li>
										<fckeditor:editor name="packagingEn" width="80%" height="300" toolbar="Standard" fileBrowser="default">
											${productInstance?.packagingEn?.decodeHTML()}
										</fckeditor:editor>
									</li>
                                </ul>
								</p>
							</div>
							<div id="product-accessories">
								<p>
                                <ul style="list-style:none;">
                                    <li><label for="accessories"><g:message code="product.description" default="Accessories" /></label></li>
                                
                                    <li>
										<fckeditor:editor name="accessories" width="80%" height="300" toolbar="Standard" fileBrowser="default">
											${productInstance?.accessories?.decodeHTML()}
										</fckeditor:editor>
									</li>
                                </ul>
                                <ul style="list-style:none;">
                                    <li><label for="accessoriesEn"><g:message code="product.descriptionEn" default="English Accessories" /></label></li>
                                
                                    <li>
										<fckeditor:editor name="accessoriesEn" width="80%" height="300" toolbar="Standard" fileBrowser="default">
											${productInstance?.accessoriesEn?.decodeHTML()}
										</fckeditor:editor>
									</li>
                                </ul>
								</p>
							</div>
							<div id="product-certificates">
								<p>
                                <ul style="list-style:none;">
                                    <li><label for="certificates"><g:message code="product.description" default="Certificates" /></label></li>
                                
                                    <li>
										<fckeditor:editor name="certificates" width="80%" height="300" toolbar="Standard" fileBrowser="default">
											${productInstance?.certificates?.decodeHTML()}
										</fckeditor:editor>
									</li>
                                </ul>
                                <ul style="list-style:none;">
                                    <li><label for="certificatesEn"><g:message code="product.descriptionEn" default="English Certificates" /></label></li>
                                
                                    <li>
										<fckeditor:editor name="certificatesEn" width="80%" height="300" toolbar="Standard" fileBrowser="default">
											${productInstance?.certificatesEn?.decodeHTML()}
										</fckeditor:editor>
									</li>
                                </ul>
								</p>
							</div>
                                </td>
                            </tr> 

                        </tbody>
				        <tfoot>
					        <tr>
						        <td colspan="2">
									<div class="buttons">
                    <span class="button"><g:actionSubmit class="save" style="width:120px;" value="${message(code:'update', 'default':'Update')}" action="updateProduct" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="removeProduct" value="${message(code:'delete', 'default':'Delete')}" /></span>
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
