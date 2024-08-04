import 'package:get/get.dart';
import 'package:task/views/screens/auth/phone_auth_screen.dart';

class LanguageSelectorController extends GetxController {
  var selectedLanguage = 'English'.obs;
  var languages = ['English', 'Spanish', 'French', 'German'];

  void changeLanguage(String? newLanguage) {
    if (newLanguage != null) {
      selectedLanguage.value = newLanguage;
    }
  }

  void navigateToPhoneAuthScreen() {
    Get.to(() => PhoneAuthScreen());
  }
}
