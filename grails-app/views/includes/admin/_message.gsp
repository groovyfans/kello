            <g:if test="${flash.message}">
            <div class="message"><img src="${createLinkTo(dir:'/images/admin', file:'info.png')}" alt="${message(code:'icon.information')}" class="icon" /><g:message code='${flash.message}'/></div>
            </g:if>
