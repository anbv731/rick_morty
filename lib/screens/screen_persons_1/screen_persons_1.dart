import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/components/search.dart';
import 'package:rick_morty/data/person.dart';
import 'package:rick_morty/data/persons_loader.dart';
import 'package:rick_morty/screens/screen_persons_2/screen_persons_2.dart';

import '../../theme/color_theme.dart';

class Persons1 extends StatefulWidget {
  @override
  _Persons1State createState() => _Persons1State();
}

class _Persons1State extends State<Persons1> {
  List<Person> persons;
  bool isList = true;

  void method() async {
    persons = await loadPerson();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    method();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Search(),
            ListTile(
                leading: Text('ВСЕГО ПЕРСОНАЖЕЙ: ${persons?.length ?? 0}',
                    style: TextStyle(color: ThemeColors.text2, fontSize: 16)),
                trailing: InkWell(
                    onTap: () {
                      setState(() {
                        isList = !isList;
                      });
                    },
                    child: SvgPicture.asset('assets/svg_icons/group.svg'))),
            Expanded(
              child: isList
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: persons?.length ?? 0,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 16, bottom: 24, right: 16),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                height: 74,
                                child: ClipOval(
                                  child: Image.network(
                                    persons[index].image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Column(
                                children: [
                                  Text(persons[index].status,
                                      style:
                                          TextStyle(color: Colors.greenAccent)),
                                  Text(
                                    persons[index].name,
                                    style: TextStyle(
                                        fontSize: 16, color: ThemeColors.text1),
                                  ),
                                  Text(
                                      '${persons[index].species} , ${persons[index].gender}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: ThemeColors.text2)),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ],
                          ),
                        );
                      })
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 18),
                      itemCount: persons?.length ?? 0,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: ClipOval(
                                child: Image.network(
                                  persons[index].image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 18,
                              width: 3,
                            ),
                            Text(persons[index].status,
                                style: TextStyle(color: Colors.greenAccent)),
                            Text(
                              persons[index].name,
                              style: TextStyle(
                                  fontSize: 16, color: ThemeColors.text1),
                            ),
                            Text(
                                '${persons[index].species} , ${persons[index].gender}',
                                style: TextStyle(
                                    fontSize: 12, color: ThemeColors.text2)),
                          ],
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
