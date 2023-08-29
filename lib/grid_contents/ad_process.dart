//import 'package:flutter/material.dart';
//import 'package:expandable/expandable.dart';

/*class AdProcess extends StatefulWidget {
  get child => null;


  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 214, 84, 67),
          centerTitle: true,
          title: Text('ADMISSION PROCESS'),
        ),
        //backgroundColor: Color.fromARGB(255, 97, 242, 223),
        //backgroundColor: Color.fromARGB(248, 8, 38, 34),
        backgroundColor: Colors.white,
        
      );
}

class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;
  MyItem(this.isExpanded, this.header, this.body);
}

class AdProcess extends StatefulWidget {
  @override
  _State createState() => new _State();
}

List<String> arr = [
  "Applicable only to the learners\n• Who have completed 15 years of age are eligible for admission.\n• Who are studying in a regular school or have already passed or failed 7th, 8th and to 9th, and failed in 10th standard.",
  "\n• Flexibility to Choose subjects.\n• Flexibility to not to attend the regular classes.",
  "There is flexibility in this system. The learner can select the subject of his/her own choice, aptitude and learning ability. The learner has to select 3 languages compulsorily."
];

class _State extends State<AdProcess> {
  List<MyItem> items = <MyItem>[];
  @override
  void initState() {
    for (int i = 0; i < 3; i++) {
      // ignore: unnecessary_new
      items.add(new MyItem(
          false,
          'Item ${i}',
          Container(
            padding: EdgeInsets.all(10.0),
            // ignore: avoid_print
            child: //print(arr[i]),
                Text(arr[i]),
          )));
    }
  }

  ExpansionPanel createitem(MyItem item) {
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Header ${item.header}'),
          );
        },
        body: item.body,
        isExpanded: item.isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADMISSION PROCESS"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 214, 84, 67),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: ListView(
          children: [
            ExpansionPanelList.radio(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  items[index].isExpanded = !items[index].isExpanded;
                });
              },
              children: items.map(createitem).toList(),
            )
          ],
        ),
      ),
    );
  }
}
*/
//import 'dart:html';

import 'package:flutter/material.dart';

class ItemModel {
  bool expanded;
  String headerItem;
  String discription;
  Color colorsItem;
  Color colorsbody;
  Color panelcol;
  // ignore: non_constant_identifier_names
  Color Bgcolor;

  ItemModel({
    this.expanded = false,
    required this.headerItem,
    required this.discription,
    required this.colorsItem,
    required this.colorsbody,
    required this.panelcol,
    // ignore: non_constant_identifier_names
    required this.Bgcolor,
  });
}

class AdProcess extends StatefulWidget {
  @override
  _AdProcessState createState() => _AdProcessState();
}

class _AdProcessState extends State<AdProcess> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color.fromARGB(255, 214, 84, 67),
        backgroundColor: const Color.fromARGB(255, 214, 84, 67),
        centerTitle: true,
        title: Text('ADMISSION PROCESS'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          key: Key('builder ${selected.toString()}'),
          shrinkWrap: true,
          //physics: const NeverScrollableScrollPhysics(),
          itemCount: itemData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 10.0),
              //color: itemData[index].panelcol,
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 500),
                dividerColor: const Color.fromARGB(255, 214, 84, 67),
                expandedHeaderPadding: EdgeInsets.only(bottom: 0.0),
                //key: Key(index.toString()),
                elevation: 1,
                children: [
                  //PANEL
                  ExpansionPanel(
                    backgroundColor: itemData[index].panelcol,
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      //itemData[index].expanded = selected;
                      isExpanded = itemData[index].expanded;
                      //expanded[index]==selected,
                      return Container(
                        color: itemData[index].Bgcolor,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          itemData[index].headerItem,
                          style: TextStyle(
                              color: itemData[index].colorsItem,
                              //backgroundColor: itemData[index].Bgcolor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: Container(
                      color: itemData[index].Bgcolor,
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      child: Scrollbar(
                        thumbVisibility: true,
                        scrollbarOrientation: ScrollbarOrientation.bottom,
                        //controller: _firstController,
                        //scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              itemData[index].discription,
                              style: TextStyle(
                                color: itemData[index].colorsbody,
                                fontSize: 18,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    isExpanded: itemData[index].expanded,
                  )
                ],

                expansionCallback: (int item, bool status) {
                  setState(() {
                    itemData[index].expanded = !itemData[index].expanded;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }

  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
      headerItem: 'Admission Process ?',
      discription:
          "NOTE: Applicable only to the learners\n• Who have completed 15 years of age are eligible for admission.\n• Who are studying in a regular school or have already passed or failed 7th, 8th and to 9th, and failed in 10th standard.\n• Who are not able to attend regular school for various reasons, who wants to complete their education in 10th or 12th classes without any consider obtain of age and some other reason\n• Learners can contact any recognized study center located nearby\n• Learners who are interested to join Karnataka Open School must submit their original school TC and their testimonials\n• Learners must submit 05 passport size photos and also proof of address, including Aadhaar Xerox copy",
      colorsItem: const Color.fromARGB(255, 214, 84, 67),
      Bgcolor: Colors.white,
      panelcol: Colors.white,
      colorsbody: Colors.black,
    ),
    ItemModel(
      headerItem: 'Facilities ?',
      discription:
          "• Flexibility to Choose subjects.\n• Flexibility to not to attend the regular classes.\n• Flexibility of time (student can do program of one year even in 2 to 3 years) if they are not ready for examination\n• Earn while you learn\n• Providing facilities at their study centers.\n• Provides resource, support model, curriculum and study materials\n• It is short academic input relationship",
      colorsItem: const Color.fromARGB(255, 214, 84, 67),
      Bgcolor: Colors.white,
      panelcol: Colors.white,
      colorsbody: Colors.black,
    ),
    ItemModel(
      headerItem: 'Selection of Subjects (Secondary Course) ? ',
      discription:
          "There is flexibility in this system. The learner can select the subject of his/her own choice, aptitude and learning ability. The learner has to select 3 languages compulsorily.\n\nLanguages\n1. First language Kannada\n2. Second language English\n3. Third Language Hindi\n\nThey are free to select any three subject out of the following six subjects.\n1. Mathematics\n2. Science and Technology\n3. Social Science\n4. Business Studies\n5. Economics\n6. Home Science\n\n• Study centers it takes responsibilities for what they learn, how quickly they learn, who helps them, when they are ready for their learning assessement.\n• Free of regular school attendance.\n• Time-bound programmes",
      colorsItem: const Color.fromARGB(255, 214, 84, 67),
      Bgcolor: Colors.white,
      panelcol: Colors.white,
      colorsbody: Colors.black,
    ),
    ItemModel(
      headerItem: '\nEligibility',
      discription:
          "Those who runs have an Educational organization / Schools, if they want to start a Study Centers, they should submit\nproposal to the KOS Head Office. Any institution which runs a schools and colleges, having educational facilities like library,\nlaboratory and etc… can apply. The officials of Karnataka Open School will visit institutions to verify the facilities in the\ninstitution and will have a discussion with the management and the staff. If the norms are fulfilled recognition will be granted to such school / organization.\n",
      colorsItem: Colors.white,
      Bgcolor: const Color.fromARGB(255, 214, 84, 67),
      panelcol: const Color.fromARGB(255, 214, 84, 67),
      colorsbody: Colors.white,
    ),
    ItemModel(
      headerItem: '\nRegistration Fee of the Learning Center',
      discription:
          "At the time of submitting proposal to Karnataka Open School, the schools / organization or NGOs has to deposit Rs. 5000/- which is not refundable.\n",
      colorsItem: Colors.white,
      Bgcolor: const Color.fromARGB(255, 214, 84, 67),
      panelcol: const Color.fromARGB(255, 214, 84, 67),
      colorsbody: Colors.white,
    ),
    ItemModel(
      headerItem: '\nPersonal Contact Programmes (PCPs)',
      discription:
          "Thirty days PCPs classes will be organized by the KOS through learning study centers\n• Thirty classes are compulsory per subject\n• Five to Ten additional classes for subjects having practicals on face to face basis.\n• PCPs classes will be conducted generally on Weekends and Holidays.\n• PCPs will be conducted in the first year admission only.\n",
      colorsItem: Colors.white,
      Bgcolor: const Color.fromARGB(255, 214, 84, 67),
      panelcol: const Color.fromARGB(255, 214, 84, 67),
      colorsbody: Colors.white,
    ),
    ItemModel(
      headerItem: '\nRole of the Co-ordinator',
      discription:
          "Each study center will have a coordinator. He /she is responsible for the smooth running of the center. The Study Learning center will provide following services…\n• Issuing Prospectus along with admission form at the prescribed cost.\n• Accepting the duly filled admission form and Examination Application form with requisite fee only.\n• The co-ordinator's will collect all the required documents from the learners and supply the study materials\n• Evaluate tutor marked assignments (TMAs)\n• Provide counseling to solve learner's problems / doubts related to the course\n• Display of results of public examination and distributions of markscard / certificate, issued by state examination board KSEEB\n",
      colorsItem: Colors.white,
      Bgcolor: const Color.fromARGB(255, 214, 84, 67),
      panelcol: const Color.fromARGB(255, 214, 84, 67),
      colorsbody: Colors.white,
    ),
    ItemModel(
      headerItem: '\nLearning Materials and Strategies',
      discription:
          "Karnataka Open School will supply learning materials to the study centers as soon as they remit the fees to study centers learners can collect these material from the coordinator of the concerned study centers.\n• Learning through printed self- learning material\n• Audio - Video programme\n• Tutor Marked Assignment (TMA)\n• Personal Contact Program (PCP)\n",
      colorsItem: Colors.white,
      Bgcolor: const Color.fromARGB(255, 214, 84, 67),
      panelcol: const Color.fromARGB(255, 214, 84, 67),
      colorsbody: Colors.white,
    ),
  ];
}

/*class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.green[200],
            child: const Text('without padding'),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(40),
            color: Colors.green[200],
            child: const Text('padding of 40 on all sides'),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(60, 50, 20, 10),
            color: Colors.green[200],
            child: const Text('different padding for different sides'),
          ),
        ],
      ),
    );
  }
}*/
