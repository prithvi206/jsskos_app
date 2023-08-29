import 'package:flutter/material.dart';

class Faculties extends StatelessWidget {
  const Faculties({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculties'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 214, 84, 67),
      ),
    );
  }
}
