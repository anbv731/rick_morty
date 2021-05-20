
import 'package:flutter/material.dart';
import 'package:rick_morty/theme/color_theme.dart';

class Search extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Найти персонажа',
          hintStyle: TextStyle(color: ThemeColors.text2, fontSize: 16),
          prefixIcon: Icon(
            Icons.search,
            color: ThemeColors.text2,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 24,
                width: 1,
                color: ThemeColors.text2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 19),
                child: Icon(
                  Icons.filter_alt_outlined,
                  color: ThemeColors.text2,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: ThemeColors.search1,
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      height: 48,
     // margin: EdgeInsets.only(left: 16, right: 16, bottom: 23, top: 54),
    );
  }
}
