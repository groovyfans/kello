<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <meta name="tab" content="order" />
        <title><g:message code="order.create" default="Create Order" /></title>
    </head>
    <body class="order">
        <div id="main_left"></div>
        <div id="content">
            <h3 class="pagetitle"><g:message code="main.order.title"/></h3>
            <hr/>
            <div class="contentbox">
                <g:render template="/includes/admin/message"/>
                <g:hasErrors bean="${orderInstance}">
                    <div class="errors">
                        <g:renderErrors bean="${orderInstance}" as="list" />
                    </div>
                </g:hasErrors>
                <g:form action="save" method="post" >
                    <table class="defaultForm" cellpadding="0" cellspacing="4" border="0" width="100%">
                        <thead>
                            <tr>
                                <td colspan="2" style="padding-left: 80px;"><p><g:message code="order.remark" default="Order Remark" /></p>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="productName"><g:message code="order.productName" default="Product Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'productName','errors')}">
                                    <input type="text" id="productName" name="productName" value="${fieldValue(bean:orderInstance, field:'productName')}"/>
                                    <font color="#FF0000">*</font>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="quantity"><g:message code="order.quantity" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'quantity','errors')}">
                                    <input type="text" id="quantity" name="quantity" value="${fieldValue(bean:orderInstance,field:'quantity')}" />
                                    <font color="#FF0000">*</font>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="customer"><g:message code="order.customer" default="Customer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'customer','errors')}">
                                    <input type="text" maxlength="100" name="customer" value="${fieldValue(bean:orderInstance, field:'customer')}"/>
                                    <font color="#FF0000">*</font>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="companyName"><g:message code="order.companyName" default="Company Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'companyName','errors')}">
                                    <input type="text" size="50" id="companyName" name="companyName" value="${fieldValue(bean:orderInstance, field:'companyName')}"/>
                                    <font color="#FF0000">*</font>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="address"><g:message code="order.address" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'address','errors')}">
                                    <input type="text" size="50" id="address" name="address" value="${fieldValue(bean:orderInstance, field:'address')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="postalCode"><g:message code="order.postalCode" default="Postal Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'postalCode','errors')}">
                                    <input type="text" id="postalCode" name="postalCode" value="${fieldValue(bean:orderInstance,field:'postalCode')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="telephone"><g:message code="order.telephone" default="Telephone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'telephone','errors')}">
                                    <input type="text" maxlength="50" id="telephone" name="telephone" value="${fieldValue(bean:orderInstance,field:'telephone')}"/>
                                    <font color="#FF0000">*</font>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="fax"><g:message code="order.fax" default="Fax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'fax','errors')}">
                                    <input type="text" id="fax" name="fax" value="${fieldValue(bean:orderInstance,field:'fax')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="email"><g:message code="order.email" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'email','errors')}">
                                    <input type="text" maxlength="100" id="email" name="email" value="${fieldValue(bean:orderInstance,field:'email')}"/>
                                    <font color="#FF0000">*</font>
                                </td>
                            </tr>

                        </tbody>
                        <tfoot>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left">
                                <div class="buttons">
                    <input class="save" type="submit" value="${message(code:'order.create', 'default':'Create')}" />&nbsp;
                    <input class="reset" type="reset" value="${message(code:'reset', 'default':'Reset')}" />
                                </div>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </g:form>
             </div>
        </div>
        <div id="main_right"></div>
    </body>
</html>
