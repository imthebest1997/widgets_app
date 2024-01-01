import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
   
  static const name = "theme_changer_screen";
  const ThemeChangerScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Tema'),
        actions: [
          IconButton(
            icon: isDarkMode ? const Icon(Icons.dark_mode_outlined) : const Icon(Icons.light_mode_outlined),
            onPressed: (){
              ref.read( themeNotifierProvider.notifier )
                .toggleDarkMode();             
            }, 
          )
        ],
      ),

      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];  

        return RadioListTile(
          title: Text("Este Color", style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,          
          value: index,
          groupValue: selectedColor,
          onChanged: (value){
            // ref.read(selectedColorProvider.notifier).state = index;
            ref.read( themeNotifierProvider.notifier ).changeColorIndex(index);
          },
        );       
      },      
    );
  }
}