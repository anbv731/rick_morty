import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/color_theme.dart';
import '../theme/color_theme.dart';

class Person {
  String name;
  String description;
  bool status;
  String picture;

  Person(this.name, this.description, this.status, this.picture);
}

class Persons extends StatelessWidget {
  List<Person> persons = [
    Person('Рик Санчез', 'Человек, Мужской', true, 'assets/images/rik.png'),
    Person('Директор Агенства', 'Человек, Мужской', true,
        'assets/images/director.png'),
    Person('Морти Смит', 'Человек, Мужской', true, 'assets/images/morty.png'),
    Person('Саммер Смит', 'Человек, Женский', true, 'assets/images/summer.png'),
    Person('Альберт Эйнштейн', 'Человек, Мужской', false,
        'assets/images/albert.png'),
    Person('Алан Райлс', 'Человек, Мужской', false, 'assets/images/alan.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: (Column(
        children: [
          Container(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: ThemeColors.text2,
                  ),
                  suffixIcon: Icon(
                    Icons.filter_alt_outlined,
                    color: ThemeColors.text2,
                  )),
            ),
            decoration: BoxDecoration(
              color: ThemeColors.search1,
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            height: 48,
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 23, top: 54),
          ),
          ListTile(
              leading: Text('ВСЕГО ПЕРСОНАЖЕЙ: ${persons.length}',
                  style: TextStyle(color: ThemeColors.text2, fontSize: 16)),
              trailing: Icon(
                Icons.list,
                color: ThemeColors.text2,
              )),
          SizedBox(height: (persons.length/2 *210) ,
            child: GridView.builder(
                //physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 18),
                itemCount: persons.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, bottom: 24, right: 16),
                        child: Column(
                          children: [
                            Container(
                              child: ClipOval(
                                child: Image.asset(
                                  persons[index].picture,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            height: 120,width: 120,),
                            SizedBox(height: 18,width: 3,),
                            Column(
                              children: [
                                if (persons[index].status == true)
                                  Text('живой',
                                      style:
                                          TextStyle(color: Colors.greenAccent)),
                                if (persons[index].status == false)
                                  Text('мертвый',
                                      style: TextStyle(color: Colors.red)),
                                Text(
                                  persons[index].name,
                                  style: TextStyle(
                                      fontSize: 16, color: ThemeColors.text1),
                                ),
                                Text(persons[index].description,
                                    style: TextStyle(
                                        fontSize: 12, color: ThemeColors.text2)),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      )),
    );
  }
}
