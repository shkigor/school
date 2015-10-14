import school.*

class BootStrap {

    def init = { servletContext ->
        def admin = new User(login:"admin", password: "admin", role:"Admin") //создаем администратора
        admin.save() //сохраняем его в БД
    }
    def destroy = {
    }
}
