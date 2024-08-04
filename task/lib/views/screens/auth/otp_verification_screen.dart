import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task/views/screens/shipper/shipper_screen.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String sentOtp;
  final String? phoneNumber;
  const OtpVerifyScreen({super.key, required this.sentOtp, required this.phoneNumber});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  TextEditingController _codeController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'verifyPhone'.tr,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'codeSent'.trParams({'phone': widget.phoneNumber ?? ''}),
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            PinCodeTextField(
              keyboardType: TextInputType.number,
              appContext: context,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                activeColor: Colors.blueAccent,
                inactiveColor: Colors.blueAccent,
                inactiveFillColor: Colors.blueAccent,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              controller: _codeController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                return true;
              },
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Add your request code logic here
              },
              child: Text(
                "didntRecevie".tr,
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              height: 60,
              color: Colors.indigo,
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: widget.sentOtp, smsCode: _codeController.text);
                  await FirebaseAuth.instance.signInWithCredential(credential).whenComplete(() =>
                      Get.to(const SelectorScreen())
                  );
                } catch (ex) {
                  print(ex.toString());
                }
                Get.to(const SelectorScreen());
              },
              child: Text(
                'verifyContinue'.tr,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
