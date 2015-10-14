package school

import java.text.SimpleDateFormat; //подключаем библиотеку для работы с датами

class PupilController {

    def scaffold = Pupil

    def diary = { // определяем action diary, т.е. функцию отвечающую за дневник ученика
        def pupil = session.user;
        SimpleDateFormat df = new SimpleDateFormat("ddMMyyyy"); // создаем переменную для работы с датами и указываем формат даты ( день, месяц, год)
        Date date; // создаем дату
        if (params.d) { // если указана дата, когда следует просматривать дневник
            date = df.parse(params.d); // приводим переданую дату к нужному виду
        } else { // если дата не указана
            date = df.parse(df.format(new Date())); // создаем текущую дату и приводим ее к нужному виду.
        }
        def c = new GregorianCalendar(); // создаем грегорианский календарь
        c.setTime(date); // устанавливаем дату
        def day = c.get(Calendar.DAY_OF_WEEK)-1; // получаем день недели, соответствующий дате
        if (day==0) day=7; // в данном случае получается воскресение
        date = date - day + 1;
        def pn = Mark.findAllByPupilAndDateBetween(pupil, date, date+1);   // ищем среди оценок такие, которые относятся к текущему ученику и поставлены в понедельник
        def vt = Mark.findAllByPupilAndDateBetween(pupil, date+1, date+2); // ищем среди оценок такие, которые относятся к текущему ученику и поставлены во вторник
        def sr = Mark.findAllByPupilAndDateBetween(pupil, date+2, date+3); // ищем среди оценок такие, которые относятся к текущему ученику и поставлены в среду
        def cht = Mark.findAllByPupilAndDateBetween(pupil,date+3, date+4); // ищем среди оценок такие, которые относятся к текущему ученику и поставлены в четверг
        def pt = Mark.findAllByPupilAndDateBetween(pupil, date+4, date+5); // ищем среди оценок такие, которые относятся к текущему ученику и поставлены в пятницу
        def sb = Mark.findAllByPupilAndDateBetween(pupil, date+5, date+6); // ищем среди оценок такие, которые относятся к текущему ученику и поставлены в суботу
        def prevdate = df.format(date.minus(7)); // создаем дату недельной давности и приводим к нужному виду
        def nextdate = df.format(date.plus(7)); // создаем дату через неделю и приводим к нужному виду
        [ // квадратные скобки означают массив map, в который заносятся передаваемые виду данные
          date: date,
          pn: pn,
          vt: vt,
          sr: sr,
          cht: cht,
          pt: pt,
          sb: sb,
          prevdate: prevdate,
          nextdate: nextdate
        ]
    }
}
