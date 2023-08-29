import 'package:flutter/material.dart';

// ignore: camel_case_types
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 214, 84, 67),
            centerTitle: true,
            title: Text('SETTINGS!!')),
        //backgroundColor: Color.fromARGB(255, 97, 242, 223),
        backgroundColor: Color.fromARGB(248, 8, 38, 34),
        body: const Center(
            child: Text(
          'settings...',
          style: TextStyle(fontSize: 20, color: Colors.white),
        )));
    //floatingActionButton: FloatingActionButton(onPressed: () async {
    //await _auth.signOut()
  }
}
