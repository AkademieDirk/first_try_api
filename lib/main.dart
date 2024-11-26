import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Hello World!'),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Drück mich"))
            ],
          ),
        ),
      ),
    );
  }
}
