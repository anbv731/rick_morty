import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/theme/color_theme.dart';

class ThemeText {
  static const TextStyle green = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.green,
      height: 1.6);
  static const TextStyle red = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.red,
      height: 1.6);
  static const TextStyle episods = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.lightBlue,
      height: 1.6);
  static const TextStyle description = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      height: 19.3 / 13);
  static const TextStyle location = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      height: 28 / 20);

}
