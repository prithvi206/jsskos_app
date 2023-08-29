//GRID HOMEPAGE
/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jsskos_app/grid_contents/exam_reg.dart';
import 'package:jsskos_app/grid_contents/exam_res.dart';
import 'package:jsskos_app/grid_contents/fees_pay.dart';
import 'package:jsskos_app/grid_contents/grade_entry.dart';
import 'package:jsskos_app/grid_contents/query.dart';
import 'package:jsskos_app/grid_contents/sub_sel.dart';
import 'package:jsskos_app/screens/SideNav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScrrenState();
}

class _HomeScrrenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideNavBar(),
      appBar: AppBar(
          centerTitle: true,
          title: const Text("JSSKOS APP"),
          backgroundColor: Color.fromARGB(255, 214, 84, 67),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.black,
              height: 4.0,
            ),
          )),
      backgroundColor: Color.fromARGB(248, 8, 38, 34),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              //childAspectRatio: .60,
            ),
            children: [
              //SUBJECT SELECTION...

              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SubSelec()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 2,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/images/subj.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Subject Selection",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),

              //EXAM...

              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExamReg()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/images/exam.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Exam Registration",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),

              //GRADES ENTRY...

              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GradeEntr()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/images/grade.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Grades Entry",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),

              //FEES PAYMENT...
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeesPay()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/images/fees.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Fees Payment",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),

              //RESULTS...
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExamRes()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/images/result.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Exam Results",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),

              //QUERY...
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Query()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/images/query.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Query",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsskos_app/Nav_bars/SideNav_bar.dart';
import 'package:jsskos_app/grid_contents/ad_process.dart';
import 'package:jsskos_app/grid_contents/exam_reg.dart';
import 'package:jsskos_app/grid_contents/exam_res.dart';
import 'package:jsskos_app/grid_contents/fees_pay.dart';
import 'package:jsskos_app/grid_contents/grade_entry.dart';
import 'package:jsskos_app/grid_contents/query.dart';
import 'package:jsskos_app/registration/registration_form.dart';

//import 'package:first_app/screens/bottom_nav.dart';
//import 'package:first_app/grid_contents/sub_sel.dart';

//List<String> _contents = <String>['Home', 'Search', 'Notifications','Settings'];
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScrrenState();
}

class _HomeScrrenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideNavBar(),
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "JSSKOS APP",
            style: TextStyle(color: Colors.white),
          ),
          //backgroundColor: Color.fromARGB(255, 229, 76, 4),
          backgroundColor: Colors.black,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: const Color.fromARGB(255, 243, 234, 234),
              height: 4.0,
            ),
          )),
      //backgroundColor: Color.fromARGB(248, 8, 38, 34),
      backgroundColor: const Color.fromARGB(255, 214, 84, 67),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
          //const EdgeInsets.all(3.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              //childAspectRatio: .60,
            ),
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdProcess()));
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 2,
                          offset: const Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*Tab(
                        icon: new Image.asset(
                          'assets/images/subj.png',
                          //height: 400,
                          //width: 400,
                          scale: 4,
                        ),
                      ),*/

                      //Admission Process
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/images/ad.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Admission Info",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              //EXAM
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExamReg()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: const Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*Icon(
                        Icons.book,
                        size: 50,
                        color: Colors.white,
                      ),
                      Tab(
                        icon: new Image.asset(
                          'assets/images/exam.png',
                          height: 250,
                          width: 250,
                        ),
                      ),*/
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/images/exam.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Examination",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrationScreen()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: const Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*Icon(
                        Icons.grade,
                        size: 50,
                        color: Colors.white,
                      ),
                      Tab(
                        icon: new Image.asset(
                          'assets/images/grade.png',
                          height: 250,
                          width: 250,
                        ),
                      ),*/
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/images/grade.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Admission Form",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeesPay()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: const Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(
                      //   Icons.money,
                      //   size: 50,
                      //   color: Colors.white,
                      // ),
                      // Tab(
                      //   icon: new Image.asset(
                      //     'assets/images/fees.png',
                      //     height: 250,
                      //     width: 250,
                      //   ),
                      // ),
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/images/fees.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Videos",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExamRes()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: const Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(
                      //   Icons.grade,
                      //   size: 50,
                      //   color: Colors.white,
                      // ),
                      // Tab(
                      //   icon: new Image.asset(
                      //     'assets/images/result.png',
                      //     height: 250,
                      //     width: 250,
                      //   ),
                      // ),
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/images/result.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Exam Results",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Query()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: const Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(
                      //   Icons.help,
                      //   size: 50,
                      //   color: Colors.white,
                      // ),
                      // Tab(
                      //   icon: new Image.asset(
                      //     'assets/images/query.png',
                      //     height: 250,
                      //     width: 250,
                      //   ),
                      // ),
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/images/query.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Query",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
