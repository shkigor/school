package school

class User {

    String login // логин
    String password // пароль
    String name // имя
    String surname //фамилия
    String sex //пол
    String address // адрес
    String phone  // телефон
    String role

    String toString() {
        "$surname $name"
    }

    static constraints = {
        role inList: ["Admin", "Teacher", "Parent", "Pupil"]
    }
}
