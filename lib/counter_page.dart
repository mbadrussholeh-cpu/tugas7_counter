import 'package:flutter/material.dart';
import 'counter_display.dart';
import 'counter_buttons.dart';

/// Parent: menyimpan state counter dan logika-nya.
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('Counter dimulai');
  }

  @override
  void dispose() {
    debugPrint('Counter ditutup');
    super.dispose();
  }

  void _add() {
    setState(() => _counter++);
  }

  void _subtract() {
    // Angka tidak boleh minus
    if (_counter > 0) {
      setState(() => _counter--);
    }
  }

  void _reset() {
    setState(() => _counter = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aplikasi Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Passing data: parent -> child lewat constructor
            CounterDisplay(value: _counter),
            const SizedBox(height: 32),
            // Callback: child memanggil fungsi milik parent
            CounterButtons(
              onAdd: _add,
              onSubtract: _subtract,
              onReset: _reset,
            ),
          ],
        ),
      ),
    );
  }
}