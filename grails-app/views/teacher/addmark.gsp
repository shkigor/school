<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="main" />
         <title>Добавить оценку</title>         
    </head>
    <body>
        <div class="body">
<h1>Добавить оценку</h1>
<g:form name="myForm" url="[controller:'teacher',action:'savemark']">
<g:hiddenField name="pupil" value="${pupil.id}" />
<g:hiddenField name="subject" value="${subject.id}" />
Студент: ${pupil.surname} ${pupil.name}<br/>
Предмет: ${subject.name}<br/>
Оценка:
<g:radioGroup name="mark" labels="['2 (неудовлетворительно)','3 (удовлевторительно)','4 (хорошо)', '5 (отлично)']" values="[2,3,4,5]" >
<p>${it.radio} ${it.label}</p>
</g:radioGroup>
<g:actionSubmit value="Добавить оценку" action="savemark" />
</g:form>
</div>
</body>
</html>