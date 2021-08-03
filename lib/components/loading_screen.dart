
import 'package:flutter/material.dart';
import 'package:rick_morty/theme/color_theme.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Theme.of(context).primaryColor,child:Center(child: CircularProgressIndicator()) ,);
  }
}
