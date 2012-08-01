

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="createProduct" />
        <title><g:message code="product.create" default="Create Product" /></title>
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
			var vPicWins = window.open(page, 'SelectImage', 'status=yes,resizable=yes,top=100,left=200,width=588,height=600,scrollbars=yes');
			if(vPicWins) {
                vPicWins.opener = self;
            }
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
		<g:message code="current" default="Current: " /><g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;<a href="#"><g:message code="product.create" default="Create Product" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>
        <g:hasErrors bean="${productInstance}">
            <div class="errors">
                <g:renderErrors bean="${productInstance}" as="list" />
            </div>
        </g:hasErrors>
		<div class="section">
			<div class="sectionHeading"><g:message code="product.create" default="Create Product" /></div>
			<div class="sectionContent">
            <g:form name="productForm" action="saveProduct" method="post" >
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
                                <td valign="top" class="label required">
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
                                    <input type="text" id="sequence" name="sequence" style="width: 60px;" value="${fieldValue(bean:productInstance,field:'sequence')}"/>&nbsp;&nbsp;<span style="color:#f00;">(<g:message code="product.sequence.desc"/>)</span>
                                </td>
                            </tr> 
							
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="smallImageUrl"><g:message code="product.smallImageUrl" default="Small Image Url" /></label><g:message code="product.smallImageUrl.desc" default="87*87" />
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'smallImageUrl','errors')}">
                                    <input type="hidden" name="smallImageUrl"/>
									<a href="javascript:void(0);" onclick="javascript:openwindow('smallImageUrl');"><g:message code="product.selectImage" default="Select Image" /></a>&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="javascript:unselectImage('smallImageUrl');"><g:message code="product.unselectImage" default="Unselect Image" /></a><br/>
									<img id="smallImageUrlPreview" src="" style="display:none;"/> 
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="largeImageUrl"><g:message code="product.largeImageUrl" default="Large Image Url" /></label><g:message code="product.largeImageUrl.desc" default="180*390" />
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'largeImageUrl','errors')}">
                                    <input type="hidden" name="largeImageUrl"/>
									<a href="javascript:void(0);" onclick="javascript:openwindow('largeImageUrl');"><g:message code="product.selectImage" default="Select Image" /></a>&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="javascript:unselectImage('largeImageUrl');"><g:message code="product.unselectImage" default="Unselect Image" /></a><br/>
									<img id="largeImageUrlPreview" src="" style="display:none;"/> 
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="detailImageUrl"><g:message code="product.detailImageUrl" default="Detail Image Url" /></label><g:message code="product.detailImageUrl.desc" default="670*265" />
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:productInstance,field:'detailImageUrl','errors')}">
                                    <input type="hidden" name="detailImageUrl"/>
									<a href="javascript:void(0);" onclick="javascript:openwindow('detailImageUrl');"><g:message code="product.selectImage" default="Select Image" /></a>&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="javascript:unselectImage('detailImageUrl');"><g:message code="product.unselectImage" default="Unselect Image" /></a><br/>
									<img id="detailImageUrlPreview" src="" style="display:none;"/> 
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
