import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/components/search.dart';
import 'package:rick_morty/screens/episodes/widgets/season1.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';

import 'package:flutter/material.dart';

class Episodes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: ThemeColors.background,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ThemeColors.background,
            automaticallyImplyLeading: false,
            title: Search('Найти эпизод',false),
            bottom: TabBar(
              isScrollable: true,
              labelPadding: EdgeInsets.only(bottom: 5, left: 15, right: 15),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              indicatorPadding: EdgeInsets.only(top: 5, bottom: 2),
              tabs: [
                Text('СЕЗОН 1', style: ThemeText.season),
                Text('СЕЗОН 2', style: ThemeText.season),
                Text('СЕЗОН 3', style: ThemeText.season),
                Text('СЕЗОН 4', style: ThemeText.season),
                Text('СЕЗОН 5', style: ThemeText.season),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Season1(),
              Season1(),
              Season1(),
              Season1(),
              Season1(),
            ],
          ),
        ),
      ),
    );
  }
}

