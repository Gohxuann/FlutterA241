import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text("Hello World"),
          ),
          body: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text("Row 1"), Text("Row 2"), Text("Row 3")]),
              Text("Flutter is Fun"),
              Text("Flutter is Fun"),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text("Row 1"), Text("Row 2"), Text("Row 3")]),
              Text("Hi my Name is Abby Goh."),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text("Row 1"), Text("Row 2"), Text("Row 3")])
            ],
          ),
        ));
  }
}
