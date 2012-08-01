

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <meta name="tab" content="order" />
        <title><g:message code="order.show" default="Show Order" /></title>
    </head>
    <body class="order">
        <div id="main_left"></div>
        <div id="content">
            <h3 class="pagetitle"><g:message code="main.order.title"/></h3>
	        <hr/>
	        <div class="contentbox">
                <g:render template="/includes/admin/message"/>
                <table class="defaultForm" cellpadding="0" cellspacing="4" border="0" width="100%">
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.customer" default="Customer" /></td>

                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'customer')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.productName" default="Product Name" /></td>

                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'productName')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.quantity" default="Quantity" /></td>

                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'quantity')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.companyName" default="Company Name" /></td>

                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'companyName')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.address" default="Address" /></td>

                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'address')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.telephone" default="Telephone" /></td>

                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'telephone')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.email" default="Email" /></td>

                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'email')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.fax" default="Fax" /></td>

                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'fax')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.postalCode" default="Postal Code" /></td>

                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'postalCode')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.orderDate" default="Order Date" /></td>

                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'orderDate')}</td>

                        </tr>

                    </tbody>
                </table>
                </div>
        </div>
        <div id="main_right"></div>
    </body>
</html>
