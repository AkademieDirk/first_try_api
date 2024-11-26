import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

void main() {
  runApp(const MainApp());
}
// Hier möchte ich mir die Aufgaben holen

Future<List<dynamic>> getTask() async {
// hier die komplette Uri die ich aufteilen muss 'https://dummyjson.com/todos'

  final Uri uri = Uri.https("dummyjson.com", "todos");
// hier packe ich mir mit get das Ergebnis in die variable response // übergeben wird an get die Variable Uri
  final http.Response response = await http.get(uri);
// hier die Abfrage ob alles ok
  if (response.statusCode == 200) {
    final String data =
        response.body; // den Body aus der Response in die Variable data

//! warum String? muss der Key immer String sein?
    final Map<String, dynamic> decodedJson = jsonDecode(
      data,
    ); // in die Map decodedJson packen wir die Daten von vorher aus dem Body aber decodiert

    final tasks = decodedJson["todos"];
    return tasks;
  }
// leere Liste bei Fehler noch ändern
  return [];
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String taskContents = "";
  int taskId = 0;
  int index = 0;
  bool completed = false;
  // Hier wird die Init State Methode am Anfang gesetzt und dann getFirstTask ausgeführt
  @override
  void initState() {
    super.initState();
    getFirstTask;
  }
// Hier eerstelle cih die Methode zum holen der ersten Aufgabe

  void getFirstTask() async {
    final List<dynamic> tasks = await getTask();
    final Map<String, dynamic> firstTask = tasks[index];
    final String firstTaskContent = firstTask["todo"];
    final int taskNumber = firstTask["id"];
    final bool complete = firstTask["completed"];
    setState(() {
      taskContents = firstTaskContent;
      taskId = taskNumber;
      completed = complete;
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Aufgabe $taskId"),
              Text(taskContents),
              completed
                  ? const Text("Aufgabe erledigt")
                  : const Text("Aufgabe noch offen"),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    getFirstTask();
                  },
                  child: const Text("Drück mich"))
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