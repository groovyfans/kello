            <g:if test="${flash.error}">
            <div class="errors"><img src="${createLinkTo(dir:'/images/admin', file:'error.png')}" alt="${message(code:'icon.warn')}" class="icon" /><g:message code='${flash.error}'/></div>
            </g:if>