package school

class Classroom {

    Integer number //номер группы
    String letter // префикс группы

    // отношение one-to-many говорит о том, что в группе может быть множество студентов
    static hasMany1 = [ pupils : Pupil ]
    // отношение one-to-many говорит о том, что у группы может быть множество изучаемых предметов
    static hasMany2 = [ subjects : Subject ]

    static constraints = {
    }
}
