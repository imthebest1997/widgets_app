import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static String name = "counter_screen";
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: isDarkMode ? const Icon(Icons.dark_mode_outlined) : const Icon(Icons.light_mode_outlined),
            onPressed: (){
              ref.read(isDarkModeProvider.notifier)
                .update((state) => !state);
              
            }, 
          )
        ],
      ),
      body: _CounterView(clickCounter),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          // ref.read(counterProvider.notifier).state ++;
          ref.read(counterProvider.notifier)
            .update((state) => state + 1);
        }
      ),
    );
  }
}

class _CounterView extends StatelessWidget {

  final int clickCounter;
  const _CounterView(this.clickCounter);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge),
    );
  }
}