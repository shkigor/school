<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Time Expression - Sign In</title>
<link href="includes/timex.css" rel="stylesheet" type="text/css">
</head>
<body leftMargin=0 topMargin=0 marginheight=0 marginwidth=0>

<div class="l3" align="center">
<div class="l2">
<table valign="middle" border="1" width="100%" height="100%" align="center">
<tr><td>

<g:form name="myForm" url="[controller:'user',action:'login']">
<table>
<tr>

<td><p>Логин</p></td>
<td><div id="login_div"><g:textField name="login" value="" class="noborder"/></div></td>
</tr>
<tr>
<td><p>Пароль</p></td>
<td><div id="pass_div"><g:passwordField name="password" value="" class="noborder"/></div></td>
</tr>
<tr>
<td colspan="2" align="right"><g:actionSubmit value="Войти" action="login" /></td>
</tr>
</table>
</g:form>

</td></tr>
</table>

</div>
</div>

</body>
</html>