import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/components/search.dart';
import 'package:rick_morty/screens/location/screen.dart';

import '../../theme/color_theme.dart';
import '../../theme/color_theme.dart';
import '../../theme/text_theme.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeColors.background,
        automaticallyImplyLeading: false,
        title: Search('Найти локацию', true),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: ListTile(
            leading: Text('ВСЕГО ЛОКАЦИЙ: 200',
                style: TextStyle(
                    color: ThemeColors.text2, fontSize: 10, height: 1.6)),
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => Location()));
            },
            child: Container(
              margin: EdgeInsets.only(
                left: 16,
                bottom: 24,
                right: 16,
              ),
              height: 218,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: ThemeColors.search1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    child: Image.asset(
                      'assets/images/earth.png',
                      fit: BoxFit.fitWidth,
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16, top: 12, right: 16, bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Земля С-137',
                          style: ThemeText.location,
                        ),
                        Text(
                          'Мир \u00B7 Измерение С-137',
                          style: ThemeText.fieldDescription,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

          //
          //   );
        },
      ),
    );
  }
}
