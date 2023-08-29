import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 214, 84, 67)),
    );
  }
}
