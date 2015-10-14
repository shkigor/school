package school

class Teacher extends User {

    // отношение one-to-many говорит о том, что у преподавателя может быть множество предметов
    static hasMany = [ subjects : Subject ]

    static constraints = {
    }
}
