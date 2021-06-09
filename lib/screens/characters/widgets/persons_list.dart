import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/components/element_of_characters_list.dart';
import 'package:rick_morty/theme/text_theme.dart';

import '../../../data/person_model.dart';
import '../../../theme/color_theme.dart';
import '../../character/screen.dart';

class PersonsList extends StatelessWidget {
  List<Person> persons;

  PersonsList({this.persons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: persons?.length ?? 0,
        itemBuilder: (_, position) {
          return ElementOfCharectersList(true, persons[position]);
          // return Padding(
          //   padding: const EdgeInsets.only(left: 16, bottom: 24, right: 16),
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           CupertinoPageRoute(
          //               builder: (context) => Character(persons[position])));
          //     },
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           width: 74,
          //           height: 74,
          //           child: ClipOval(
          //             child: Image.network(
          //               persons[position].image,
          //               fit: BoxFit.contain,
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 18,
          //         ),
          //         Column(
          //           children: [
          //             Text(persons[position].status, style: ThemeText.green),
          //             Text(
          //               persons[position].name,
          //               style: ThemeText.name,
          //             ),
          //             Text(
          //                 '${persons[position].species} , ${persons[position].gender}',
          //                 style: ThemeText.fieldDescription),
          //           ],
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        });
  }
}
