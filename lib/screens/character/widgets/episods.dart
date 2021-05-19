import 'package:flutter/material.dart';
import 'package:rick_morty/theme/color_theme.dart';

class ListEpisods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Эпизоды',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Text(
                'Все эпизоды',
                style: TextStyle(fontSize: 12, color: ThemeColors.text2),
              ),
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        height: 74,
                        width: 74,
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Image.asset('assets/images/episod1.png'),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('серия 1',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(34, 162, 189, 0.87))),
                            Text(
                              'Пилот',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Text('1 декабря 2013',
                                style: TextStyle(
                                    fontSize: 14, color: ThemeColors.text2)),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: Colors.white,
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
