import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task/views/screens/auth/otp_verification_screen.dart';

class MobileNumberController extends GetxController {
  var isVerifying = false.obs;
  final phoneController = TextEditingController();

  void verifyPhoneNumber() async {
    isVerifying.value = true;

    // await FirebaseAuth.instance.verifyPhoneNumber(
    //   phoneNumber: "+91${phoneController.text.trim()}",
      // verificationCompleted: (PhoneAuthCredential credential) {
      //   isVerifying.value = false;
      //   print("Phone auth completed");
      // },
      // verificationFailed: (FirebaseAuthException e) {
      //   isVerifying.value = false;
      //   print(e.toString());
      // },
      // codeSent: (String otp, int? resendToken) {
      //   isVerifying.value = false;
        Get.to(() => OtpVerifyScreen(sentOtp: "otp",phoneNumber:phoneController.text.trim()));
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {
    //     isVerifying.value = false;
    //   },
    // );
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
