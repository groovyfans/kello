
			<div class="arrowlistmenu">
<g:ifAnyGranted role="ROLE_ADMIN,ROLE_SUPERVISOR">
                <h3 class="menuheader expandable"><span>在线订单</span></h3>
                <ul class="categoryitems">
                    <li ${pageProperty(name:'meta.page') == 'order' ? 'class="selected"' : ''}><span><g:link action="orders">订单管理</g:link></span></li>
                </ul>
                <h3 class="menuheader expandable"><span>产品管理</span></h3>
                <ul class="categoryitems">
                    <li ${pageProperty(name:'meta.page') == 'categories' ? 'class="selected"' : ''}><span><g:link action="categories">产品分类管理</g:link></span></li>
                    <li ${pageProperty(name:'meta.page') == 'addCategory' ? 'class="selected"' : ''}><span><g:link action="addCategory">添加产品分类</g:link></span></li>
                    <li ${pageProperty(name:'meta.page') == 'products' ? 'class="selected"' : ''}><span><g:link action="products">产品管理</g:link></span></li>
                    <li ${pageProperty(name:'meta.page') == 'createProduct' ? 'class="selected"' : ''}><span><g:link action="createProduct">添加产品</g:link></span></li>
                </ul>
                <h3 class="menuheader expandable"><span>新闻中心</span></h3>
                <ul class="categoryitems">
					<li ${pageProperty(name:'meta.page') == 'news' ? 'class="selected"' : ''}><span><g:link action="news">新闻管理</g:link></span></li>
                    <li ${pageProperty(name:'meta.page') == 'addNews' ? 'class="selected"' : ''}><span><g:link action="addNews">添加新闻</g:link></span></li>
                </ul>
                <h3 class="menuheader expandable"><span>在线留言</span></h3>
                <ul class="categoryitems">
                    <li ${pageProperty(name:'meta.page') == 'messages' ? 'class="selected"' : ''}><span><g:link action="messages">留言管理</g:link></span></li>
                </ul>
                <h3 class="menuheader expandable"><span>附件管理</span></h3>
                <ul class="categoryitems">
                    <li ${pageProperty(name:'meta.page') == 'attachments' ? 'class="selected"' : ''}><span><g:link action="attachments">附件管理</g:link></span></li>
                </ul>
</g:ifAnyGranted>
<g:ifAllGranted role="ROLE_SUPERVISOR">
                <h3 class="menuheader expandable"><span>帐号管理</span></h3>
                <ul class="categoryitems">
                    <li ${pageProperty(name:'meta.page') == 'createAccount' ? 'class="selected"' : ''}><span><g:link action="createAccount">添加帐号</g:link></span></li>
                    <li ${pageProperty(name:'meta.page') == 'accounts' ? 'class="selected"' : ''}><span><g:link action="accounts">帐号管理</g:link></span></li>
                </ul>
                <h3 class="menuheader expandable"><span>网站管理</span></h3>
                <ul class="categoryitems">
                    <li ${pageProperty(name:'meta.page') == 'system' ? 'class="selected"' : ''}><span><g:link action="system">系统信息</g:link></span></li>
                    <li ${pageProperty(name:'meta.page') == 'settings' ? 'class="selected"' : ''}><span><g:link action="settings">网站设置</g:link></span></li>
                </ul>
</g:ifAllGranted>
            </div>
