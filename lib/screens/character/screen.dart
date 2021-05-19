import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:rick_morty/data/persons_loader.dart';
import 'package:rick_morty/theme/color_theme.dart';

class Character extends StatelessWidget {
  Character(this.person);

  Person person = Person();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height / 4 + 80,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(person.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: MediaQuery.of(context).size.height / 4 - 80,
                    child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.black,
                        child: ClipOval(
                          child: Image.network(
                            person.image,
                            width: 146,
                            height: 146,
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                  Positioned(
                    left: 24,
                    top: 54,
                    child: FloatingActionButton(
                      backgroundColor: Colors.black,
                      elevation: 1,
                      onPressed: () => {},
                      child: Icon(Icons.arrow_back_sharp),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Text(
                    person.name,
                    style: TextStyle(fontSize: 34, color: Colors.white),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    person.status,
                    style: TextStyle(fontSize: 10, color: Colors.greenAccent),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Text(
                    'Главный протагонист мультсериала "Рик  и Морти". Безумный ученый,чей алкоголизм, безрассудство и социопатия заставляют беспокоится семью его дочери.',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 40,
                            child: Column(
                              children: [
                                Text('Пол:',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ThemeColors.text2)),
                                Text('${person.gender}',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 40,
                            child: Column(
                              children: [
                                Text('Раса:',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ThemeColors.text2)),
                                Text('${person.species}',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 36,
                    child: ListTile(
                        leading: Column(
                          children: [
                            Text('Место рождения:',
                                style: TextStyle(
                                    fontSize: 12, color: ThemeColors.text2)),
                            Text('${person.species}',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                          ],
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )),
                  ),
                  ListView.builder(shrinkWrap: true,itemCount:6,physics:ScrollPhysics(parent: NeverScrollableScrollPhysics()),itemBuilder: (_, index) {
                    return ListTile(
                      leading: Container(
                        height: 74,
                        width: 74,
                        decoration: BoxDecoration(color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      title: Column(children: [Text('серия 1',
                        style: TextStyle(
                            fontSize: 14, color: Colors.white)), Text('Пилот',
                      style: TextStyle(
                          fontSize: 14, color: Colors.white),)],),
                      subtitle: Text('1 декабря 2013',
                    style: TextStyle(
                    fontSize: 14, color: Colors.white)),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
