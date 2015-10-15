package school

class Mark {

    Pupil pupil
    Subject subject
    Integer mark
    Date date = new Date(); //дата проставления оценки

    String toString() {
        "$subject, $pupil, $mark, $date"
    }

    static constraints = {
    }
}
