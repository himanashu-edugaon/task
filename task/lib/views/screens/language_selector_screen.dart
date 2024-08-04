import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/views/screens/auth/phone_auth_screen.dart';

class LanguageSelectorScreen extends StatefulWidget {
  const LanguageSelectorScreen({super.key});

  @override
  LanguageSelectorScreenState createState() => LanguageSelectorScreenState();
}

class LanguageSelectorScreenState extends State<LanguageSelectorScreen> {
  String _selectedLanguage = 'English';
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = _selectedLanguage;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(tag: "tag", child: Image.asset("assets/images/img_2.png")),
                  const SizedBox(height: 20),
                   Text(
                    'selectLanguage'.tr,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                   Text(
                    'youCanLanguage'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: PopupMenuButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(_selectedLanguage),
                          Icon(CupertinoIcons.arrowtriangle_down_fill,size: 20,)
                        ],),
                        offset: const Offset(-5, 34),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            padding: const EdgeInsets.symmetric(horizontal: 55,),
                            child: const Text("HINDI"), onTap: () {
                          Get.updateLocale(const Locale("hi","HI"));
                          setState(() {
                            _selectedLanguage = 'HINDI';
                          });
                          },),
                        PopupMenuItem(
                          padding: const EdgeInsets.symmetric(horizontal: 55,),
                          child: const Text("ENGLISH"), onTap: () {
                          Get.updateLocale(const Locale("en","EN"));
                          setState(() {
                            _selectedLanguage = 'ENGLISH';
                          });
                        },),
                      ]
                        ,),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    elevation: 2,
                    height: 45,
                    color: const Color(0xFF2f3a62),
                    minWidth: MediaQuery.of(context).size.height * 0.2,
                    onPressed: () {
                      // Handle button press
                      Get.to(PhoneAuthScreen());
                    },
                    child: Text(
                      'next'.tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 100,
              child: CustomPaint(
                painter: WavePainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveWidget extends StatelessWidget {
  const WaveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: CustomPaint(
        painter: WavePainter(),
      ),
    );
  }
}
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2f3a62)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.6,
          size.width * 0.5, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.4, size.width, size.height * 0.5)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);

    final paint2 = Paint()
      ..color = const Color(0xFF2f3a62)
      ..style = PaintingStyle.fill;

    final path2 = Path()
      ..moveTo(0, size.height * 0.4)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.5,
          size.width * 0.5, size.height * 0.4)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.3, size.width, size.height * 0.4)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


