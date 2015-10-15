<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'loginmain.css')}" />
<script type="text/javascript" src="/school/js/jquery-1.2.6.js"></script>
<script type="text/javascript" src="/school/js/jquery.corner.js"></script>
<script type="text/javascript" src="/school/js/corner.js"></script>
<title>Авторизация</title>
</head>
<body>
<form action="/school/user/login" method="post" name="myForm" id="myForm" >
<center>

<table height="100%">
<tr height="300">
<td align=center>
<div class="logo"><img src="${createLinkTo(dir:'images',file:'j_logo.png')}" alt="Электронный журнал" /></div>
</td>
</tr>

<tr height="50%">

<td>

<div id="main">
<table class="login">
<tr>
<td rowspan=3><img src="${createLinkTo(dir:'images',file:'key.png')}"></td>
<td><p>Логин</p></td>
<td><div id="login_div"><input class="noborder" type="text" size="20" name="login" id="login"></div></td>
</tr>
<tr>
<td><p>Пароль</p></td>
<td><div id="pass_div"><input class="noborder" type="password" size="20" name="password" id="password"></div></td>
</tr>
<tr>
<td colspan="2" align="right"><input type="submit" value="Войти"></td>
</tr>
</table>
</div>

</td>

</tr>

<tr height="25%">
<td>
&nbsp;
</td>
</tr>

</table>

</center>
</form>
</body>
</html>