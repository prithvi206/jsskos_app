import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsskos_app/Authentication/controllers/profile_controller.dart';
import 'package:jsskos_app/Authentication/models/user_model.dart';
import 'package:jsskos_app/Authentication/repository/authentication_repository.dart';
import 'package:jsskos_app/Authentication/repository/user_repository.dart';
import 'package:jsskos_app/drawer_contents/drawer_item.dart';
import 'package:jsskos_app/drawer_pages.dart/Calendar.dart';
import 'package:jsskos_app/drawer_pages.dart/Faculties.dart';
import 'package:jsskos_app/drawer_pages.dart/Syllabus.dart';
import 'package:jsskos_app/drawer_pages.dart/Videos.dart';
import 'package:jsskos_app/drawer_pages.dart/profile.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 214, 84, 67),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 40, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              const SizedBox(
                height: 40,
              ),
              drawerItems(
                  name: ' Profile',
                  icon: Icons.edit,
                  onPressed: () => OnItemPressed(context, index: 0)),
              const SizedBox(
                height: 30,
              ),
              drawerItems(
                  name: ' Syllabus',
                  icon: Icons.book,
                  onPressed: () => OnItemPressed(context, index: 1)),
              const SizedBox(
                height: 30,
              ),
              drawerItems(
                  name: ' Calendar',
                  icon: Icons.calendar_view_day_outlined,
                  onPressed: () => OnItemPressed(context, index: 2)),
              const SizedBox(
                height: 30,
              ),
              drawerItems(
                  name: ' Faculties',
                  icon: Icons.person,
                  onPressed: () => OnItemPressed(context, index: 3)),
              const SizedBox(
                height: 30,
              ),
              drawerItems(
                  name: ' Videos',
                  icon: Icons.video_library_outlined,
                  onPressed: () => OnItemPressed(context, index: 4)),
              const SizedBox(
                height: 30,
              ),
              drawerItems(
                name: " Log Out",
                icon: Icons.logout,
                onPressed: () {
                  AuthenticationRepository.instance.logout();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void OnItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Profile()));
        break;

      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Syllabus()));
        break;

      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Calendar()));
        break;

      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Faculties()));
        break;

      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Videos()));
        break;

      default:
        Navigator.pop(context);
        break;
    }
  }

  Widget headerWidget() {
    final controller = Get.put(ProfileController());

    // const url = '';

    return Container(
      child: FutureBuilder(
        future: controller.getUserDataById(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel userData = snapshot.data as UserModel;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CircleAvatar(
                  //   radius: 40,
                  //   backgroundImage: NetworkImage(url),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          userData.fullName,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          userData.email,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ],
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: Text("Something went Wrong."),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
