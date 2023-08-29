import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Calendar'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 214, 84, 67)),
    );
    backgroundColor:
    Color.fromARGB(248, 8, 38, 34);
  }
}
