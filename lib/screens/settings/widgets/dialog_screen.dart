import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';
import 'package:rick_morty/theme/theme_manager.dart';
import 'package:rick_morty/theme/theme_types.dart';

enum ThemeVariants {
  off,
  on,
  system,
}

class DialogScreen extends StatelessWidget {
  ValueNotifier _notifier = ValueNotifier<ThemeVariants>(ThemeVariants.system);

  @override
  Widget build(BuildContext context) {
    final themeVM = Provider.of<ThemeNotifier>(context);
    return AlertDialog(
      title: Text('Темная тема', style: Theme.of(context).textTheme.headline6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      contentPadding: EdgeInsets.only(top: 10),
      insetPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      actions: [
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text('ОТМЕНА', style: Theme.of(context).textTheme.headline5))
      ],
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).dialogBackgroundColor,
        ),
        height: 240.0,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Theme(
            data: ThemeData(unselectedWidgetColor: AppColors.textOverlineDark),
            child: Column(
              children: [
                RadioListTile<ThemeType>(
                  title: Text(
                    "Включена",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  value: ThemeType.dark,
                  groupValue: themeVM.getThemeType(),
                  onChanged: (value) => themeVM.setThemeStyle(value),
                ),
                RadioListTile<ThemeType>(
                  title: Text(
                    "Выключена",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  value: ThemeType.light,
                  groupValue: themeVM.getThemeType(),
                  onChanged: (value) => themeVM.setThemeStyle(value),
                ),
                RadioListTile<ThemeType>(
                  title: Text(
                    "Следовать настройкам системы",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  value: ThemeType.byDevice,
                  groupValue: themeVM.getThemeType(),
                  onChanged: (value) => themeVM.setThemeStyle(value),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
