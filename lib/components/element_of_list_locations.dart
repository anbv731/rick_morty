import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/data/location_model.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';
import 'package:rick_morty/screens/location/screen.dart';

class ElementOfListLocations extends StatelessWidget {
  Location location;

  ElementOfListLocations(this.location);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => ScreenLocation(location: location)));
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
            color: Theme.of(context).dividerColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              child: Image.network(
                location.imageName,
                fit: BoxFit.fitWidth,
                height: 150,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    '${location.type} · ${location.measurements}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
