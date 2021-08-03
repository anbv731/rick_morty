import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rick_morty/theme/app_colors.dart';
import 'package:rick_morty/theme/theme_types.dart';
import 'package:rick_morty/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Dark and Light Srtyles for application

class ThemeNotifier with ChangeNotifier {
  ///
  /// APPLICATION DARK STYLE
  ///

  final darkTheme = ThemeData(
    fontFamily: 'Roboto',
    // primarySwatch: Colors.grey,
    primaryColor: AppColors.primaryDark,
    brightness: Brightness.dark,
    // backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    // accentIconTheme: IconThemeData(color: Colors.black),
    canvasColor: AppColors.lightBlack,
    dividerColor: AppColors.lightBlack,
    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: AppColors.primaryDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.green,
      unselectedItemColor: AppColors.gray,
    ),
    textTheme: TextTheme(
        headline4: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 34,
          letterSpacing: 0.25,
          color: Colors.white,
        ),
        headline6: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 20,
          letterSpacing: 0.15,
          color: Colors.white,
        ),
        overline: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 10,
            letterSpacing: 1.5,
            color: AppColors.textOverlineDark,
            height: 1.6),
        caption: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          letterSpacing: 0.5,
          color: AppColors.subTitle,
        ),
        bodyText1: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.44,
          color: AppColors.textOverlineDark,
        ),
        bodyText2: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: 0.25,
          color: Colors.white,
        ),
        subtitle1: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.15,
          color: AppColors.textOverlineDark,
        ),
        headline1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textOverlineDark,
            height: 20 / 14),
        headline2: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 24 / 16),
        headline3: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            height: 24 / 16),
        headline5: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 24 / 14),
        subtitle2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            height: 32 / 24)),
    dialogBackgroundColor: AppColors.lightBlack,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.resolveWith((state) => Colors.white),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.lightBlack,
    ),
  );

  ///
  /// APPLICATION LIGHT STYLE
  ///

  final lightTheme = ThemeData(
    fontFamily: 'Roboto',
    // primarySwatch: Colors.grey,
    primaryColor: AppColors.primaryLight,
    brightness: Brightness.light,
    //backgroundColor: const Color(0xFFE5E5E5),
    accentColor: AppColors.black,
    // accentIconTheme: IconThemeData(color: Colors.white),
    canvasColor: Colors.white,
    dividerColor: AppColors.dividerLight,
    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.textOverlineLight,
      ),
    ),
    scaffoldBackgroundColor: AppColors.primaryLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.gray4,
      selectedIconTheme: IconThemeData(color: AppColors.blue),
      unselectedIconTheme: IconThemeData(color: AppColors.gray4),
    ),
    textTheme: TextTheme(
        headline4: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 34,
          letterSpacing: 0.25,
          color: AppColors.black,
        ),
        headline6: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 0.15,
            color: AppColors.black,
            height: 28 / 20),
        overline: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 10,
          letterSpacing: 1.5,
          color: AppColors.textOverlineLight,
        ),
        caption: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            letterSpacing: 0.5,
            color: AppColors.textOverlineLight,
            height: 16 / 12),
        bodyText1: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.44,
          color: AppColors.textOverlineLight,
        ),
        bodyText2: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: 0.25,
            color: Colors.black,
            height: 20 / 14),
        subtitle1: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.15,
          color: AppColors.textOverlineLight,
        ),
        headline1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textOverlineLight,
            height: 20 / 14),
        headline2: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 24 / 16),
        headline3: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            height: 24 / 16),
        headline5: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 24 / 14),
        subtitle2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            height: 32 / 24),
     ),

    dialogBackgroundColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.resolveWith((state) => AppColors.buttonText),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.dividerLight,
    ),
  );

  // Active theme style
  ThemeData _themeData;

  ThemeData getTheme() => _themeData;

  // Active theme type
  ThemeType _activeThemeType;

  ThemeType getThemeType() => _activeThemeType;

  ThemeNotifier() {
    // Initial active theme style and type
    initTheme();
  }

  void initTheme() {
    // Detected theme (light or dark)
    final brightness = SchedulerBinding.instance.window.platformBrightness;
    if (brightness == Brightness.dark) {
      _themeData = darkTheme;
      _activeThemeType = ThemeType.dark;
    } else {
      _themeData = lightTheme;
      _activeThemeType = ThemeType.light;
    }

    // Get data from local save
    SharedPreferences.getInstance().then(
      (prefs) {
        final localThemeType = prefs.getString(Constants.ThemeType);

        if (localThemeType != null) {
          _activeThemeType = ThemeType.values
              .firstWhere((element) => element.toString() == localThemeType);
        } else {
          _activeThemeType = ThemeType.byDevice;
        }

        if (_activeThemeType == ThemeType.dark) {
          _themeData = darkTheme;
        } else if (_activeThemeType == ThemeType.light) {
          _themeData = lightTheme;
        } else {
          final brightness =
              SchedulerBinding.instance.window.platformBrightness;
          if (brightness == Brightness.dark) {
            _themeData = darkTheme;
          } else {
            _themeData = lightTheme;
          }
        }

        notifyListeners();
      },
    );
  }

  // Change application Theme (light, dark, system)
  void setThemeStyle(ThemeType themeType) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.ThemeType, '$themeType');
    _activeThemeType = themeType;
    initTheme();
  }
}
