import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/screens/screen_characters/widgets/search.dart';
import '../../theme/color_theme.dart';

import 'package:rick_morty/data/persons_loader.dart';
import 'package:rick_morty/screens/character/screen.dart';
import 'package:rick_morty/screens/screen_characters/widgets/persons_grid.dart';
import 'package:rick_morty/screens/screen_characters/widgets/persons_list.dart';

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
      appBar: AppBar(
        elevation: 0,
          backgroundColor: ThemeColors.background,
          automaticallyImplyLeading: false,
        title:Search(),
        bottom:  PreferredSize(preferredSize: Size.fromHeight(60),
        child: ListTile(
            leading: Text('ВСЕГО ПЕРСОНАЖЕЙ: ${persons?.length ?? 0}',
                style: TextStyle(color: ThemeColors.text2, fontSize: 10,height: 1.6)),
            trailing: InkWell(
                onTap: () {
                  setState(() {
                    isList = !isList;
                  });
                },
                child: isList
                ?SvgPicture.asset('assets/svg_icons/grid.svg'):
                SvgPicture.asset('assets/svg_icons/list.svg'))),)
      ),
      body: SafeArea(
        child: isList
            ? PersonsList(persons:persons)
            : PersonsGrid(persons: persons,),
      ),
    );
  }
}
