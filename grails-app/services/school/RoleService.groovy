package school

import grails.transaction.Transactional

@Transactional
class RoleService {

    // def serviceMethod() {  }

    // создаем ассоциативный массив map, в котором разместим пары страница/допустимые_роли. Т.е кто к каким страницам имеет доступ
    static def map = [
            "null/null":["Admin", "Teacher", "Parent", "Pupil"], //зайти на главную могут все
            "user/logout":["Admin", "Teacher", "Parent", "Pupil"], //выйти из системы могут все
            "user/login":["Admin", "Teacher", "Parent", "Pupil"], //войти в систему могут все
            "pupil/*":["Admin"], //редактировать учетные записи учеников может только администратор
            "parent/*":["Admin"], //редактировать учетные записи родителей может только администратор
            "teacher/*":["Admin"], //редактировать учетные записи учителей может только администратор
            "mark/*":["Admin"], //редактировать оценки может только администратор
            "subject/*":["Admin"], //редактировать список предметов может только администратор
            "classroom/*":["Admin"], //редактировать список групп может только администратор
            "user/*":["Admin"], //редактировать учетные записи пользователей может только администратор
            "teacher/journal":["Teacher"], // к журналу учителя имеет доступ только учитель
            "teacher/addmark":["Teacher"], // добавлять оценки млжет только учитель
            "teacher/savemark":["Teacher"], // сохранять оценки млжет только учитель
            "teacher/editmark":["Teacher"], // редактировать оценки млжет только учитель
            "teacher/updatemark":["Teacher"], // изменять оценки млжет только учитель
            "teacher/deletemark":["Teacher"], // удалять оценки млжет только учитель
            "pupil/diary":["Admin", "Pupil"], // к дневнику пользователя имеет доступ только администратор и ученик
    ]
    static public boolean isValid(String c, String a, String code) { //функция проверяет доступ в систему по текущей роли ( String code)
        String page = c+"/"+a      // получаем страницу объединяя констроллер с действием
        if (map.containsKey(page)) // если в map'e есть требуемая страница
            if (map[page].contains(code)) { // если для этой страницы разрешена текущая роль
                return true; // то открываем к этой странице доступ
            }
        if (map.containsKey(c+"/*"))  // если в map'e есть требуемая страница, полученная объединением констроллера и любого действия
            if (map[c+"/*"].contains(code)) { // если для этой страницы разрешена текущая роль
                return true;  // то открываем к этой странице доступ
            }
        return false; // в случае, если текущая роль не подходит к запрашиваемой странице, то доступ к этой странице закрывается
    }
}
