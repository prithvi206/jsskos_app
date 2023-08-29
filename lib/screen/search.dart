import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 214, 84, 67),
        centerTitle: true,
        title: const Text('SEARCH ANYTHING!'),
      ),
      //backgroundColor: Color.fromARGB(255, 97, 242, 223),
      backgroundColor: Color.fromARGB(248, 8, 38, 34),
      body: const Center(
          child: Text(
        'Searching...',
        style: TextStyle(fontSize: 20, color: Colors.white),
      )));
  //body: Center(child: Text('Search')));
  //floatingActionButton: FloatingActionButton(onPressed: () async {
  //await _auth.signOut()
}
