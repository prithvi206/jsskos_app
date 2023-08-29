import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jsskos_app/Authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {}

  Future<UserModel> getUserDetailsById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("users").doc(id).get();
    final userdata = UserModel.fromSnapshot(snapshot);

    return userdata;
  }
}
