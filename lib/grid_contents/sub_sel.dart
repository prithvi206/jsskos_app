import 'package:flutter/material.dart';
import 'package:jsskos_app/drawer_pages.dart/Videos.dart';
import 'package:jsskos_app/grid_contents/grade_entry.dart';

class SubSelec extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 214, 84, 67),
          centerTitle: true,
          title: const Text('Course Selection'),
        ),
        backgroundColor: Colors.white,
        body: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: SizedBox(
                    child: Card(
                      elevation: 3,
                      child: ListTile(
                        title: const Padding(
                          padding: EdgeInsets.fromLTRB(8, 2, 0, 2),
                          child: Text("Maths",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600)),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Videos(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  child: SizedBox(
                    child: Card(
                      elevation: 3,
                      child: ListTile(
                        title: const Padding(
                          padding: EdgeInsets.fromLTRB(8, 2, 0, 2),
                          child: Text("Physics",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600)),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Videos(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  child: SizedBox(
                    child: Card(
                      elevation: 3,
                      child: ListTile(
                        title: const Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                          child: Text("Chemistry",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600)),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Videos(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  child: SizedBox(
                    child: Card(
                      elevation: 3,
                      child: ListTile(
                        title: const Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                          child: Text("Biology",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600)),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Videos(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  child: SizedBox(
                    child: Card(
                      elevation: 3,
                      child: ListTile(
                        title: const Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                          child: Text("Social",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600)),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Videos(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )),
      );
}
