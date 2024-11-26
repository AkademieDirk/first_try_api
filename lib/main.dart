import 'package:flutter/material.dart';
import "package:http/http.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final String _response = "Klicke auf den Button für eine API-Abfrage";
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

//! BeispielStrukur 
/*{
  "todos": [
    {
      "id": 1,
      "todo": "Do something nice for someone I care about",
      "completed": true,
      "userId": 26
    },
    {...},
    {...}
    // 30 items
  ],
  "total": 150,
  "skip": 0,
  "limit": 30
} */