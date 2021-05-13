class Person {
  final String name;
  final String description;
  final bool status;
  final String picture;

  const Person(this.name, this.description, this.status, this.picture);

  static const List<Person> persons = [
    Person('Рик Санчез', 'Человек, Мужской', true, 'assets/images/rik.png'),
    Person('Директор Агенства', 'Человек, Мужской', true,
        'assets/images/director.png'),
    Person('Морти Смит', 'Человек, Мужской', true, 'assets/images/morty.png'),
    Person('Саммер Смит', 'Человек, Женский', true, 'assets/images/summer.png'),
    Person('Альберт Эйнштейн', 'Человек, Мужской', false,
        'assets/images/albert.png'),
    Person('Алан Райлс', 'Человек, Мужской', false, 'assets/images/alan.png'),
  ];
}
