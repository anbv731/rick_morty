import 'package:flutter/material.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';

enum ThemeVariants { off, on, system, energo }

class DialogScreen extends StatelessWidget {
  ValueNotifier _notifier = ValueNotifier<ThemeVariants>(ThemeVariants.system);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Темная тема', style: ThemeText.location),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      backgroundColor: ThemeColors.search1,
      contentPadding: EdgeInsets.only(top:10),
      insetPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.only(left: 20,right: 20,bottom: 20),

      actions: [InkWell(
          onTap: (){Navigator.pop(context);

          },
          child: Text('ОТМЕНА',style:ThemeText.season))],



      content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ThemeColors.search1,
          ),
          height: 240.0,

          child: Padding(
            padding: const EdgeInsets.all(0),
            child: ValueListenableBuilder(
              valueListenable: _notifier,
              builder: (context, value, child) {
                return Theme(
                  data: ThemeData(unselectedWidgetColor: ThemeColors.textdescript),
                  child: Column(
                    children: [
                      RadioListTile(
                        value: ThemeVariants.off,
                        groupValue: _notifier.value,
                        onChanged: (newValue) {
                          changer(newValue);
                        },
                        title: Text(
                          'Выключена',
                          style: ThemeText.theme,
                        ),
                      ),
                      RadioListTile(
                        value: ThemeVariants.on,
                        groupValue: _notifier.value,
                        onChanged: changer,
                        title: Text(
                          'Включена',
                          style: ThemeText.theme,
                        ),
                      ),
                      RadioListTile(
                        value: ThemeVariants.system,
                        groupValue: _notifier.value,
                        onChanged: changer,
                        title: Text(
                          'Следовать настройкам системы',
                          style: ThemeText.theme,
                        ),
                      ),
                      RadioListTile(
                        value: ThemeVariants.energo,
                        groupValue: _notifier.value,
                        onChanged: changer,
                        title: Text(
                          'В режиме энергосбережения',
                          style: ThemeText.theme,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }

  changer(newValue) {
    _notifier.value = newValue;
  }
}
