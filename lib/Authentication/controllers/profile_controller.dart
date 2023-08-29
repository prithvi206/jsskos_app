import 'package:get/get.dart';
import 'package:jsskos_app/Authentication/repository/authentication_repository.dart';
import 'package:jsskos_app/Authentication/repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserDataById() {
    final id = _authRepo.firebaseUser.value?.uid;
    if (id != null) {
      return _userRepo.getUserDetailsById(id);
    } else {
      Get.snackbar("Error", "Login to Continue");
    }
  }
}
