<%--
  Created by IntelliJ IDEA.
  User: igor
  Date: 15.10.15
  Time: 0:56
--%>

<%--
<%
    // в начале нужно отправить пользователя на нужную страницу в зависимсти от его роли
    if (session.user) { // если авторизация прошла успешно
        if (session.user.getRole() == "Pupil") {   // если роль "ученик"
            response.sendRedirect("pupil/diary"); //
        }
        if (session.user.getRole() == "Teacher") { //если роль "преподаватель"
            response.sendRedirect("teacher/journal");
        }
    } else {
        response.sendRedirect("user/login"); //перадресация на страницу авторизации
    }
%>
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<head>
    <title>Welcome to Grails</title>
    <meta name="layout" content="main" />
</head>
<body>
<div class="dialog" style="margin-left:20px;width:60%;">
    <ul>
        <g:each var="c" in="${grailsApplication.controllerClasses}"> <!-- создает список контроллеров -->
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
        </g:each>
            </ul>
        </div>
    </body>
</html>