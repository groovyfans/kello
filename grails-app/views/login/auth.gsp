<html>
	<head>
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
		<meta name='layout' content='none' />
		<title><g:message code="app.title.login" default="Login" /></title>
	</head>
	<body id="page">
		<div id="loginbox">

			<form action='${request.contextPath}/j_spring_security_check' method='POST' id='loginForm'>
			<table cellpadding="0" cellspacing="0" border="0" bgcolor="#003366" width="100%" height="200" align="center" style="margin:auto;padding:auto;border:1px solid #000000;">
				<tr>
					<td>
						<table cellpadding="4" cellspacing="0" border="0" width="100%" height="200">
							<tr>
								<td colspan="2" bgcolor="#3c78b5" class="colHeaderLink">
									<b><font color="#ffffff"><g:message code="login.title" default="Login" /></font></b></a>
							   </td>
							</tr>
							<tr><td style="background-color: #ffffff">			
								<g:if test='${flash.message}'>
									<div style="padding:4px 0 0 95px;color: #f00;"><g:message code='${flash.message}'/></div>
								</g:if>
								</td>
							</tr>
							<tr>
								<td style="background-color: #ffffff">
								
									<table width="100%" align="center" cellpadding="0" cellspacing="10" border="0">
										<tr>
											<td valign="middle" align="right" width="35%"><label for="j_username"><b><g:message code="login.username" default="Username" /></b></label></td>
											<td valign="middle"><input style="width: 12em;" type="text" name='j_username' id='j_username' value='${request.remoteUser}' size="25" tabindex="1" accessKey="u"></td>
										</tr>
										<tr>
											<td valign="middle" align="right" width="35%"><label for="username"><b><g:message code="login.password" default="Password" /></b></label></td>
											<td valign="middle"><input style="width: 12em;" type="password" name='j_password' id='j_password' size="25" tabindex=2 accessKey="p" value="${params.j_password}"></td>
										</tr>
										<tr>
											<td valign="middle" align="right" width="35%"></td>
											<td valign="middle"><g:link url="" title="Change"><jcaptcha:jpeg name="imageCaptcha" height="40px" width="163px" /></g:link></td>
										</tr>
										<tr>
											<td valign="middle" align="right" width="35%"><label for="captcha"><b><g:message code="login.captcha" default="Captcha" /></b></label></td>
											<td valign="middle"><input style="width: 12em;" type="text" name='captcha' id='captcha' size="25" tabindex=2 accessKey="c" value="${params.captcha}"></td>
										</tr>
										<tr>
											<td valign="middle" align="center" colspan="2"><input type="submit" value="&nbsp;${message(code:'login.login')}&nbsp;"></td>
										</tr>
									</table>
								
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
		</div>
<script type='text/javascript'>
<!--
(function(){
	document.forms['loginForm'].elements['j_username'].focus();
})();
// -->
</script>
	</body>
</html>
