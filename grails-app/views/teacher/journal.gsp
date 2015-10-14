<%--
  Created by IntelliJ IDEA.
  User: igor
  Date: 15.10.15
  Time: 1:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <g:javascript src="javascripts/prototype.js" /> <!--подключаем библиотеку prototype. js -->
    <g:javascript src="javascripts/effects.js" /> <!--подключаем библиотеку prototype. js -->
    <g:javascript src="javascripts/window.js" />
    <g:javascript src="javascripts/window_effects.js" />
    <g:javascript src="javascripts/debug.js" />
    <g:javascript src="windows.js" />
    <link rel="stylesheet" href="${createLinkTo(dir:'css/themes/',file:'default.css')}" /> <!-- указываем путь к темам -->
    <link rel="stylesheet" href="${createLinkTo(dir:'css/themes/',file:'lighting.css')}" />
    <title>Электронный журнал</title>
</head>
<body>
<div class="body">
    <g:form name="myForm" url="[controller:'teacher',action:'journal']">
        <g:select optionKey="id" optionValue="name" name="subject" from="${subjectList}"  value="${subject.id}"/></br>
        <g:actionSubmit value="Показать журнал" action="journal" />
    </g:form>
    <center>

        <table class="nextprev">
            <tr>
                <td id="prev">
                    <g:link action="journal" params="[d:prevdate]"><img src="${createLinkTo(dir:'images',file:'back.png')}">Предыдущяя неделя</g:link> <!-- ссылка для перехода на предыдущую неделю -->
                </td>
                <td id="next">
                    <g:link action="journal" params="[d:nextdate]">Следующая неделя<img src="${createLinkTo(dir:'images',file:'forward.png')}"></g:link>   <!-- ссылка для перехода на следующую неделю -->
                </td>
            </tr>
        </table>

        <table class="journal" id="jour">
            <tr>
                <td rowspan=2 colspan=2>ФИО</td>
                <td>ПН</td>
                <td>ВТ</td>
                <td>СР</td>
                <td>ЧТ</td>
                <td>ПТ</td>
                <td>СБ</td>
                <td>ВС</td>
            </tr>
            <tr>
                <g:each in="${listDate}" var="date">  <!-- выводим список дат  -->
                    <td><g:formatDate format="dd.MM" date="${date}"/></td>
                </g:each>
            </tr>
            <g:each in="${pupils}" var="p">
                <tr>  <!-- выводим список студентов -->
                    <td class="surname"><img src="${createLinkTo(dir:'images',file:'user.png')}"> ${p.surname} ${p.name}</td>
                    <td>
                        <a href='#' onclick="${remoteFunction(action:'addmark',update:[success:'addmark', failure:'error'], params:[pupil:p.id,subject:subject.id], before:'winaddmark()')}"><img src="${createLinkTo(dir:'images',file:'add.png')}"></a>
                    </td>

                    <g:each in="${listDate}" var="date">
                        <td>  <!-- выставляем студентам оценки в соответствии с датой -->
                        &nbsp
                        <g:findAll in="${marks}" expr="it.pupil == p && it.date == date">
                            <% def m = it.mark %>
                            <g:link action="editmark" params="[mark:it.id]">${m}</g:link>  <!-- создаем ссылку на оценке, чтобы при нажатии на нее мы могли ее редактировать -->
                        </g:findAll>
                        </td>
                    </g:each>

                </tr>
            </g:each>
        </table>
    </center>
</div>
</body>
</html>