import 'package:flutter/material.dart';

class Syllabus extends StatelessWidget {
  const Syllabus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syllabus'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 214, 84, 67),
      ),
    );
  }
}
