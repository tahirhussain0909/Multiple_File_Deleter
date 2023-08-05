import 'package:flutter/material.dart';
import 'package:multiple_file_deleter/file_deletion_screen.dart';

void main() {
  runApp(MaterialApp(
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
      body: const FileDeleteScreen(),
    ),
  ));
}
