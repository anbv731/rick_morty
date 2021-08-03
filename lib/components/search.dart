import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/theme/color_theme.dart';

class Search extends StatelessWidget {
  Search(this.hintText, this.isfilter);

  String hintText;
  bool isfilter;

  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyText1,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/svg_icons/search.svg',
                height: 24,
                width: 24,
              ),
            ),
            suffixIcon: isfilter
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VerticalDivider(
                        indent: 12,
                        endIndent: 12,
                        color: Theme.of(context).dividerColor,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 13, right: 19),
                          child:
                              SvgPicture.asset('assets/svg_icons/filter.svg')),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  )
                : null),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      height: 48,
      // margin: EdgeInsets.only(left: 16, right: 16, bottom: 23, top: 54),
    );
  }
}
