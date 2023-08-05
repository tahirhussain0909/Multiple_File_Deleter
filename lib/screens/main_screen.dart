import 'package:flutter/material.dart';
import 'file_deletion_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.blueAccent,
        fontFamily: 'Montserrat',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter File Delete'),
          centerTitle: true,
        ),
        body: FileDeleteScreen(),
      ),
    );
  }
}
