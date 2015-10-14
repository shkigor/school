package school

class Parent extends User {

    String workplace //место работы

    // отношение one-to-many говорит о том, что у родителя может быть множество детей
    static hasMany = [ pupils : Pupil ]

    // mappedBy говорит как два взаимосвязанных класса обмениваются информацией друг с другом.
    // Используется когда один класс содержит экземпляры другого класса,
    // имеющие в себе экземпляры данного класса.
    // В данной ситуации  GORM'у нужно явно указать какой из классов содержит отношение one-to-many с другим.
    static mappedBy = [ pupils : "mother", pupils : "father" ]

    static constraints = {
    }
}
