import 'package:flutter/material.dart';
//import 'package:first_app/screens/home.dart';

class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          centerTitle: true,
          title: const Text(
            'Welcome to KOS!!',
            style: TextStyle(color: Colors.white),
          ),
        ),

        //backgroundColor: Color.fromARGB(255, 97, 242, 223),
        backgroundColor: const Color.fromARGB(255, 214, 84, 67),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Image.asset('assets/images/welcomtokos.png'),
                  Container(
                    padding: const EdgeInsets.all(20.00),
                    child: const Text(
                      "Dear learner,\nI welcome to all you for choosing the Karnataka Open School (KOS) as your preferred option for continuing your studies.You will find that KOS is an institution with a difference.\n\nIt is an open school which encourages flexibility and freedom in learning. About more than one lakh students are on role of KOS pursuing their Secondary education course. By joining KOS, you too will become a part of the largest open schooling system in the state.\n\nKOS acts as state level Board of School Education. It has being vested with the authority to enroll, guide examine and certify students upto Secondary and Senior Secondary School Level. (10th & 12th Std.) The open schooling courses study of KOS have the same standard and equivalence as the course of the studies of state level SSLC board of school education.\n\nKOS offers its courses of study through Open and Distance Learning (ODL) mode of education popularly known as open school. KOS adopt NIOS designing own curriculum, self learning materials and media support programmes utilizing expertise of faculty from various academic education institutions. KOS offers Nine subjects (including three languages) at the secondary stage in Kannada and English mediums. Core subjects are compulsory except three languages. One can choose subject according to his/her interest, need and vision of career path. You have the freedom to choose your subject, pace and place of learning.KOS has more direct contact with its learners. The study material is distributed through study centres to each candidate. He/she can now communicate directly with KOS via the study centre for providing promotion and direct support. The study material is developed by NIOS in English medium. KOS translate it to Kannada and obtain permission from DSERT Textbook Directorate. The print material coupled with face to face personal contact programme (PCP) at the study center and media support programmes empower the learners of KOS to come to the standards of the student studying in formal school. During the course study in KOS, a learner can also avail the facility of the Tutor Marker Assignments (TMA) which helps in developing regular study habits and checking the progress of learning.\n\nSSLC Board is conduct the public examination in the every academic year in April-May and July-August. There is facility of accumulation of credits. In this sheems gives you will details of admission, courses of studying, instructional process, payment of fees, study centers, equivalence of KOS examination and information about several other items relevant and use to those who desire to enrol in KOS course of study.\n\nI welcome you to KOS with hope and you will find your studies in this institute meaningful and rewarding.\n\nShivaswamy C.S,\nDirector,\nJSS Karnataka Open School,\nMysore",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Image.asset('assets/images/Directors.png'),
                ],
              ),
            ))));
  }
}
