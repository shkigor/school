package school

class Pupil extends User {

    Classroom classroom // группа
    Parent father // отец
    Parent mother // мать

    String toString() {
        "$surname $name"
    }

    // отношение one-to-many говорит о том, что у студента может быть множество оценок
    static hasMany = [ marks : Mark ]

    static constraints = {
    }
}
