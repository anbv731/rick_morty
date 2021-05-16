// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:rick_morty/components/search.dart';
// import 'package:rick_morty/data/person.dart';
// import 'package:rick_morty/data/persons_loader.dart';
// import 'package:rick_morty/theme/color_theme.dart';
//
// class Persons2 extends StatelessWidget {
//   List<Person> persons;
//   void method() async {
//     persons = await loadPerson();
//   }
//   @override
//   Widget build(BuildContext context) {
//     method();
//     return Scaffold(
//       backgroundColor: ThemeColors.background,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Search(),
//             ListTile(
//                 leading: Text('ВСЕГО ПЕРСОНАЖЕЙ: ${persons.length}',
//                     style: TextStyle(color: ThemeColors.text2, fontSize: 16)),
//                 trailing: Icon(
//                   Icons.list,
//                   color: ThemeColors.text2,
//                 )),
//             Expanded(
//               child:
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
