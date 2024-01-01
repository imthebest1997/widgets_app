
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Estado => isDarkModeProvider = boolean
final isDarkModeProvider = StateProvider((ref) => false);

//Listado de colores inmmutables
final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme (custom)


// Clase a controlar, Estado a controlar 
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);

class ThemeNotifier extends StateNotifier<AppTheme>{
  //State
  ThemeNotifier():super(AppTheme());

  void toggleDarkMode(){
    state = state.copyWith(isDarkMode:!state.isDarkMode);
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }
}