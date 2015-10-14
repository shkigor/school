package school

import java.text.SimpleDateFormat; //подключаем библиотеку для работы с датами

class TeacherController {

    def scaffold = Teacher

    def journal = {
        def teacher = session.user; //получаем текущего учителя
        def subject; // предмет

        SimpleDateFormat df = new SimpleDateFormat("ddMMyyyy");// создаем переменную для работы с датами и указываем формат даты ( день, месяц, год)
        Date date; // создаем дату
        if (params.d) {// если указана дата, когда следует просматривать журнал
            date = df.parse(params.d); // приводим переданую дату к нужному виду
        } else {
            date = df.parse(df.format(new Date())); // создаем текущую дату и приводим ее к нужному виду.
        }
        def c = new GregorianCalendar(); // создаем грегорианский календарь
        c.setTime(date); // устанавливаем дату
        def day = c.get(Calendar.DAY_OF_WEEK)-1; // получаем день недели, соответствующий дате
        if (day==0) day=7; // в данном случае получается воскресение
        date = date - day + 1;
        def prevdate = df.format(date.minus(7)); // создаем дату недельной давности и приводим к нужному виду
        def nextdate = df.format(date.plus(7)); // создаем дату через неделю и приводим к нужному виду

        //Формируем список дат
        def listDate = [];
        for(Date i = date; i<=date+6; i++) {
            listDate.add(i);
        }
        //Получаем предмет
        if (params.subject) {
            subject = Subject.get(params.subject);
        } else {
            subject = Subject.findByTeacher(teacher);
        }
        //Получаем список класса
        def pupils = Pupil.findAllByClassroom(subject.classroom);
        //Получаем список оценок для предмета. Между датами.
        def marks = Mark.findAllBySubjectAndDateBetween(subject, date, date+7);
        //Форматируем дату оценки к виду ddMMyyyy
        marks.each { it.date = df.parse(df.format(it.date)); }
        //передаем данные виду
        [
                listDate:listDate,
                pupils: pupils,
                subjectList: Subject.findAllByTeacher(teacher),
                subject: subject,
                marks: marks,
                prevdate: prevdate,
                nextdate: nextdate
        ]
    }
    // action добавить оценку
    def addmark = {
        def subject = Subject.get(params.subject); // получаем нужный предмет
        def pupil = Pupil.get(params.pupil); // получаем нужного ученика
        render(template: "/windows/addmark", model:[pupil: pupil, subject: subject]) // показываем форму для добавления оценок
    }
    // action редактировать оценку
    def editmark = {
        def mark
        if (params.mark) {
            mark = Mark.get(params.mark);
        }
        // передаем оценку
        [
                mark:mark
        ]
    }
    // action сохранить оценку
    def savemark = {
        def subject = Subject.get(params.subject); // получаем нужный предмет
        if (params.mark) { // если оценка есть

            def pupil = Pupil.get(params.pupil); // получаем нужного ученика
            def mark = new Mark(subject:subject, pupil:pupil, mark:params.mark) // создаем выбранную оценку по конкретному предмету для определенного ученика.
            mark.save(); // сохраняем в оценку в БД
            redirect(action:"journal", params:[subject:subject.id]) // осуществляем редирект на журнал учителя

        } else {
            //render(view:"/teacher/error", model:subject) // иначе должны показать ошибку, если не выбрана оценка
        }
    }
    // action изменить оценку
    def updatemark = {
        if (params.markid) { // если выбрана требуемая оценка для изменения ( передается ее идентификатор id)
            def mark = Mark.get(params.markid); // получаем оценку по id
            mark.setMark(Integer.parseInt(params.mark)) //изменяем оценку, приводя передаваемую оценку к типу int
            mark.save(); //сохраняем оценку
            redirect(action:"journal", params:[subject:params.subject]) // осуществляем редирект на журнал учителя

        } else {
            //render(view:"/teacher/error", model:subject) // иначе должны показать ошибку, если не выбрана оценка
        }
    }
    // action удалить оценку
    def deletemark = {
        if (params.markid) { // если выбрана оценка, которую следует удалить ( передается id )
            def mark = Mark.get(params.markid); // получаем ее по id
            mark.delete(); // удаляем ее из БД
            redirect(action:"journal", params:[subject:params.subject]) // осуществляем редирект на журнал учителя
        } else {
            //render(view:"/teacher/error", model:subject) // иначе должны показать ошибку
        }
    }
}
