enum ThemeType { dark, light, byDevice }

String themeName(ThemeType themeType) {
  switch (themeType) {
    case ThemeType.dark:
      return "Включена";
    case ThemeType.light:
      return "Выключена";
    case ThemeType.byDevice:
      return "Следовать настройкам системы";
  }
}
