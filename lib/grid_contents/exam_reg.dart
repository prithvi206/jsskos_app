/*import 'package:flutter/material.dart';

class ExamReg extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 214, 84, 67),
          centerTitle: true,
          title: Text('REGISTER FOR YOUR UPCOMING EXAM!!'),
        ),
        //backgroundColor: Color.fromARGB(255, 97, 242, 223),
        backgroundColor: Color.fromARGB(248, 8, 38, 34),
      );
}*/

import 'package:flutter/material.dart';

class ItemModel {
  bool expanded;
  String headerItem;
  String discription;
  Color colorsItem;
  Color colorsbody;
  Color panelcol;
  String img;
  //int fees;
  // ignore: non_constant_identifier_names
  Color Bgcolor;

  ItemModel({
    this.expanded = false,
    required this.headerItem,
    required this.discription,
    required this.colorsItem,
    required this.colorsbody,
    required this.panelcol,
    required this.img,
    //required this.fees,
    // ignore: non_constant_identifier_names
    required this.Bgcolor,
  });
}

class ExamReg extends StatefulWidget {
  @override
  _ExamRegState createState() => _ExamRegState();
}

class _ExamRegState extends State<ExamReg> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color.fromARGB(255, 214, 84, 67),
        backgroundColor: const Color.fromARGB(255, 214, 84, 67),
        centerTitle: true,
        title: Text('EXAMINATION'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          //key: Key('builder ${selected.toString()}'),
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
                key: Key(index.toString()),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //height: 87,
                            //width: 87,
                            //padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              itemData[index].img,
                              fit: BoxFit.cover,
                            ),
                          ),
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
      headerItem: 'Registration Fee ?',
      discription:
          "At the time of submitting a proposal to Karnataka Open School, the school management /NGO has to deposit of Rs. 5000/- (Five Thousand ) only non- refundable.\n",
      colorsItem: const Color.fromARGB(255, 214, 84, 67),
      Bgcolor: Colors.white,
      panelcol: Colors.white,
      colorsbody: Colors.black,
      img: 'assets/images/space.png',
    ),
    ItemModel(
      headerItem: 'Results ?',
      discription:
          "Karnataka Secondary Education Examination Board will conduct examination on the lines of regular SSLC and issues marks card to the successful students.\n",
      colorsItem: const Color.fromARGB(255, 214, 84, 67),
      Bgcolor: Colors.white,
      panelcol: Colors.white,
      colorsbody: Colors.black,
      img: 'assets/images/space.png',
    ),
    ItemModel(
      headerItem: 'Certification ? ',
      discription:
          "Karnataka State Education Examination Board will conduct the examination once in a year on par with regular SSLC March / April. There is a provision for the failed students to appear for supplementary examination in the month of June. The marks card will be issued to the successful learners by the Karnataka Secondary Education Examination Board.\n",
      colorsItem: const Color.fromARGB(255, 214, 84, 67),
      Bgcolor: Colors.white,
      panelcol: Colors.white,
      colorsbody: Colors.black,
      img: 'assets/images/space.png',
    ),
    ItemModel(
      headerItem: 'FEES STRUCTURE\n',
      colorsItem: const Color.fromARGB(255, 214, 84, 67),
      Bgcolor: Colors.white,
      panelcol: Colors.white,
      colorsbody: Colors.black,
      discription:
          "NOTE: The KOS is not receiving any financial grant from Central Government or State Government.",
      img: 'assets/images/fees struc.png',
    ),
  ];
}
