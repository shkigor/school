<h1>
<g:formRemote name="myForm" update="updateMe"
              url="[ controller: 'teacher', action: 'savemark', params: [ pupil: pupil.id, subject: subject.id ]]" after="winaddmarkclose()">
Студент: ${pupil.surname} ${pupil.name}<br/>
Предмет: ${subject.name}<br/>
Оценка:
<g:radioGroup name="mark" labels="['2 (неудовлетворительно)','3 (удовлевторительно)','4 (хорошо)', '5 (отлично)']" values="[2,3,4,5]" >
<p>${it.radio} ${it.label}</p>
</g:radioGroup>
<g:actionSubmit value="Добавить оценку" action="savemark" />
</g:formRemote>
</h1>