package school

class UserController {

    def scaffold = User

    def login = { // определяем action логин, т.е. функцию отвечающую за авторизацию
        if(request.get) render(view:"login") // если переменные переданы не методом post, а методом get, то отображаем вид login (страницу  авторизации). Сделано для безопасности.
        else { //если переменные переданы методом post
            def u = User.findByLogin(params.login) // ищем пользователя в БД, у которого  логин совпадает с логином, введенным пользователем при авторизации (params.login). params – это список передаваемых параметров.
            if(u) { // если такой пользователь существует
                if(u.password == params.password) {// если пароль пользователя совпдает с введеным паролем при авторизации
                    session.user = u // начинаем сессию пользователя
                    redirect(uri:"/") // показываем главную страницу пользователя
                }
                else { // если введен неверный пароль
                    render(view:"login", model:[message:"Password incorrect"]) // показываем страницу авторизации и помещаем в модель сообщение о вводе неправильного пароля.
                }
            }
            else {
                render(view:"login", model:[message:"User not found"])			// показываем страницу авторизации и помещаем в модель сообщение о том, что введенный пользователь не был найден.
            }
        }
    }
    def logout = { // определяем action logout т.е. функцию отвечающую за выход из системы
        log.info "User agent: " + request.getHeader("User-Agent")
        session.invalidate() //завершаем сессию
        redirect(action:"login") //переход на страницу авторизации
    }
}
