<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="main" />
         <title>Редактировать оценку</title>         
    </head>
    <body>
        <div class="body">
<h1>Редактировать оценку</h1>
<g:form name="myForm" url="[controller:'teacher',action:'updatemark']">
<g:hiddenField name="markid" value="${mark.id}" />
<g:hiddenField name="subject" value="${mark.subject.id}" />
Студент: ${mark.pupil.surname} ${mark.pupil.name}<br/>
Предмет: ${mark.subject.name}<br/>
Оценка:
<g:radioGroup name="mark" labels="['2 (неудовлетворительно)','3 (удовлевторительно)','4 (хорошо)', '5 (отлично)']" values="[2,3,4,5]" value="${mark.mark}">
<p>${it.radio} ${it.label}</p>
</g:radioGroup>
<g:actionSubmit value="Редактировать оценку" action="updatemark" />
</g:form>
<g:form name="myForm" url="[controller:'teacher',action:'deletemark']">
<g:hiddenField name="markid" value="${mark.id}" />
<g:actionSubmit value="Удалить оценку" action="deletemark" />
</g:form>
</div>
</body>
</html>