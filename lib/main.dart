import 'package:flutter/material.dart';
import 'models/counter.dart';
import 'settings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => MySetting(),
    ),
    ChangeNotifierProvider(
      create: (_) => MyCounter(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Caculator',
      theme: ThemeData(
        brightness: context.watch<MySetting>().isDark
            ? Brightness.dark
            : Brightness.light,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Provider'),
        actions: [
          Switch(
            value: context.watch<MySetting>().isDark,
            onChanged: (value) {
              // context.read<MySetting>().setBrightness(value);
              Provider.of<MySetting>(context, listen: false).setBrightness(value);
              //dùng Provider.of thì sẽ ko update Wiget nếu listen  = false
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          context.watch<MyCounter>().myCounter.toString(),
          style: const TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<MyCounter>().add();
        },
      ),
    );
  }
}
