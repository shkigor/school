package school

class Subject {

    String name // название предмета
    Classroom classroom // группа, у которой он преподается
    Teacher teacher // учитель преподающий предмет

    String toString() {
        "$name, $classroom, $teacher"
    }

    // отношение one-to-many говорит о том, что по предмету может быть выставлено множество оценок
    static hasMany = [ marks : Mark ]

    static constraints = {
    }
}
