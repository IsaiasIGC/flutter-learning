import 'package:flutter/material.dart';


class ThemeChanger with ChangeNotifier {

  bool _darkTheme = false;
  bool _customTheme = false;

  late ThemeData _currentTheme = ThemeData();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeChanger( int theme ) {

    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          colorScheme: ThemeData.light().colorScheme.copyWith(
            primary: Colors.pink
          ),
        );
      break;

      case 2:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ThemeData.dark().colorScheme.copyWith(
            secondary: Colors.pink
          )
        );
      break;

      case 3:
        _darkTheme = false;
        _customTheme = true;
      break;

      default:
        _darkTheme = false;
        _darkTheme = false;
        _currentTheme = ThemeData.light();
    }

  }


  set darkTheme( bool value ) {
    _customTheme = false;
    _darkTheme = value;

    if ( value ) {
      _currentTheme = ThemeData.dark().copyWith(
      colorScheme: ThemeData.dark().colorScheme.copyWith(
            secondary: Colors.pink
      ),
    );
    } else {
      _currentTheme = ThemeData.light().copyWith(
        colorScheme: ThemeData.light().colorScheme.copyWith(
          secondary: Colors.pink
        )
      );
    }

    notifyListeners();
  }

  set customTheme( bool value ) {
    _customTheme = value;
    _darkTheme = false;

    if ( value ) {
    _currentTheme = ThemeData.dark().copyWith(
      colorScheme: ThemeData.dark().colorScheme.copyWith(
            secondary: const Color(0xff4BA0EB)
          ),
      primaryColorLight: Colors.white,
      scaffoldBackgroundColor: const Color(0xff16202B),
      textTheme: const TextTheme(
        bodyLarge: TextStyle( color: Colors.white)
      )
    );
  } else {
    _currentTheme = ThemeData.light();
  }

    notifyListeners();
  }

}