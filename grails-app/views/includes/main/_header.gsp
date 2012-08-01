<div id="header">
    <div id="header_left"></div>
    <g:render template="/includes/main/navbar"/>
    <div id="header_right"><a href="${createLink(controller:'home', params:[lang:'zh_CN'])}"><span><g:message code='language.chinese'/></span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${createLink(controller:'home', params:[lang:'en'])}"><span><g:message code='language.english'/></span></a></div>
</div>