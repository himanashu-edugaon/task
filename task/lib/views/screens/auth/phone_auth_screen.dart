import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task/controllers/auth_controller/phone_controller.dart';
import 'package:task/views/screens/auth/phone_widget_screen.dart';

class PhoneAuthScreen extends StatelessWidget {
 final MobileNumberController controller = Get.put(MobileNumberController());
 PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Get.back();},icon: Icon(Icons.highlight_remove),),
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Text(
                    'enterPhone'.tr,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "receiveFourDigit".tr,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                    IntlPhoneField(
                      controller: controller.phoneController,
                      flagsButtonPadding: const EdgeInsets.all(8),
                      dropdownIconPosition: IconPosition.trailing,
                      decoration: InputDecoration(
                        labelText: 'phoneNumber'.tr,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),

                  SizedBox(height: 20),
                  Obx(() => controller.isVerifying.value
                      ? Center(child: CircularProgressIndicator())
                      : MaterialButton(
                    elevation: 2,
                    height: 45,
                    color: Color(0xFF2D3E50),
                    minWidth: double.infinity,
                    onPressed: controller.verifyPhoneNumber,
                    child: Text(
                      'continues'.tr,
                      style: TextStyle(color: Colors.white) ,
                    ),
                  )),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: WaveWidget(),
          ),
        ],
      ),
    );
  }
}
