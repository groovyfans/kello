                    <li>
                        <div class="p"><g:link controller="products" action="view" id="${p.model}">
                            <img src="${createLinkTo(dir:'/upload')}/${p.smallImageUrl}" width="87" height="87" alt="<k:fieldValue bean='${p}' field='name' translate='true'/>"><h3><k:fieldValue bean='${p}' field='name' translate='true' wrap="8"/></h3>
                            <g:if test="${p.isNew}">
                            <span class="new"><img src="${createLinkTo(dir:'images/main',file:'new.gif')}" width="30" height="16" alt=""></span>
                            </g:if>
                        </g:link>
                        </div>
                    </li>