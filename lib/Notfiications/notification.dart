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

class notifications extends StatefulWidget {
  @override
  _notificationsState createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color.fromARGB(255, 214, 84, 67),
        backgroundColor: const Color.fromARGB(255, 214, 84, 67),
        centerTitle: true,
        title: const Text(
          'NOTIFICATIONS',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          //key: Key('builder ${selected.toString()}'),
          shrinkWrap: true,
          //physics: const NeverScrollableScrollPhysics(),
          itemCount: itemData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              //color: itemData[index].panelcol,
              child: ExpansionPanelList(
                animationDuration: const Duration(milliseconds: 500),
                dividerColor: const Color.fromARGB(255, 214, 84, 67),
                expandedHeaderPadding: const EdgeInsets.only(bottom: 0.0),
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
                        padding: const EdgeInsets.all(10),
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
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 20),
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
      headerItem: 'Time Table for internals',
      discription: "The Scheduled timetable is....\n",
      colorsItem: const Color.fromARGB(255, 214, 84, 67),
      Bgcolor: Colors.white,
      panelcol: Colors.white,
      colorsbody: Colors.black,
      img: 'assets/images/space.png',
    ),
    ItemModel(
      headerItem: 'Cultural Event',
      discription: "Event is scheduled on 4th February, 2023\n",
      colorsItem: const Color.fromARGB(255, 214, 84, 67),
      Bgcolor: Colors.white,
      panelcol: Colors.white,
      colorsbody: Colors.black,
      img: 'assets/images/space.png',
    ),
    ItemModel(
      headerItem: 'Seminar on the importance of IT',
      discription: "Seminar is Scheduled on 1st February, 2023\n",
      colorsItem: const Color.fromARGB(255, 214, 84, 67),
      Bgcolor: Colors.white,
      panelcol: Colors.white,
      colorsbody: Colors.black,
      img: 'assets/images/space.png',
    ),
    ItemModel(
      headerItem: 'Eligibility Criteria',
      discription: "The Criteria is....\n",
      colorsItem: const Color.fromARGB(255, 214, 84, 67),
      Bgcolor: Colors.white,
      panelcol: Colors.white,
      colorsbody: Colors.black,
      img: 'assets/images/space.png',
    ),
    ItemModel(
      headerItem: 'Science Fest',
      discription: "All the Science Enthusiasts get ready...\n",
      colorsItem: const Color.fromARGB(255, 214, 84, 67),
      Bgcolor: Colors.white,
      panelcol: Colors.white,
      colorsbody: Colors.black,
      img: 'assets/images/space.png',
    ),
    ItemModel(
      headerItem: 'Music Contest',
      discription: "ALl the Music Enthusiasts get ready....\n",
      colorsItem: const Color.fromARGB(255, 214, 84, 67),
      Bgcolor: Colors.white,
      panelcol: Colors.white,
      colorsbody: Colors.black,
      img: 'assets/images/space.png',
    ),
  ];
}
