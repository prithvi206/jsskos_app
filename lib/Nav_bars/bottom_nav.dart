import 'package:flutter/material.dart';
import 'package:jsskos_app/screen/about.dart';
import 'package:jsskos_app/screen/home.dart';
import 'package:jsskos_app/Notfiications/notification.dart';
//import 'package:first_app/screens/search.dart';
/*class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  //final _auth = FirebaseAuth.instance;
  int _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  //final tabs = [
  //  Center(child: Text('Home')),
  //  Center(child: Text('Search')),
  //  Center(child: Text('Notifications')),
  //  Center(child: Text('Settings')),
  //];

  //inal screens = [
  // HomeScreen(),
  // Search(),
  // notifications(),
  // settings(),
  //];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('JSSKOS APP'),
        ),
        backgroundColor: Color.fromARGB(255, 214, 84, 67),
      ), //appbar
      //body: tabs[_currentIndex],
      //body: BottomNavContents(
      //  index: _currentIndex,
      //),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 20,
          items: [
            //home
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.orange),
            //search
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.orange),
            //notification
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notification',
                backgroundColor: Colors.orange),
            //settings
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.orange),
          ],
          onTap: (index) {
            setState(() {
              HomeScreen();
              _currentIndex = index;
            });
          }),
    );
  }
}
*/

//List<String> _contents = <String>['Home', 'Search', 'Notification', 'Settings'];

class MyBottomNav extends StatefulWidget {
  @override
  MyBottomNavState createState() {
    return new MyBottomNavState();
  }
}

class MyBottomNavState extends State<MyBottomNav> {
  int _currentIndex = 0;

  _onTapItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _myBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      //fixedColor: Colors.orange,
      onTap: _onTapItem,
      type: BottomNavigationBarType.fixed,

      selectedFontSize: 20,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.orange),
        /*BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.orange),*/
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
            backgroundColor: Colors.orange),
        BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: 'About',
            backgroundColor: Colors.orange),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Center(
          child: Text('JSSKOS APP'),
        ),
        backgroundColor: Color.fromARGB(255, 214, 84, 67),
        //elevation: Constants.elevation(),
      ),*/
      body: BottomNavContents(
        index: _currentIndex,
      ),
      bottomNavigationBar: _myBottomNavBar(),
    );
  }
}

class BottomNavContents extends StatelessWidget {
  BottomNavContents({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: navBarContents(index, context),
      ),
    );
  }

  Widget navBarContents(int index, BuildContext context) {
    switch (index) {
      case 0:
        return const HomeScreen();
      /*case 1:
        return Search();*/
      case 1:
        return notifications();
      case 2:
        return about();
      default:
        return Container();
    }
  }
}
