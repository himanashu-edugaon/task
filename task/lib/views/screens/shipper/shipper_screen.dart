
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SelectorScreen extends StatefulWidget {
  const SelectorScreen({super.key});

  @override
  SelectorScreenState createState() => SelectorScreenState();
}

class SelectorScreenState extends State<SelectorScreen> {
  String _selectedProfile = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1 ,),
            Text(
              'selectProfile'.tr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            _buildProfileOption(
              title: 'shipper'.tr,
              description: 'loremIpsum'.tr,
              icon: Icons.home_repair_service_outlined,
              value: 'shipper',
            ),
            SizedBox(height: 20),
            _buildProfileOption(
              title: 'transport'.tr,
              description: 'loremIpsum'.tr,
              icon: Icons.local_shipping_outlined,
              value: 'transporter',
            ),
            SizedBox(height: 55,),
            const SizedBox(height: 20),
            MaterialButton(
              height: 60,
              minWidth: MediaQuery.of(context).size.height * 0.4,
              color: Colors.indigo,
              onPressed: () {
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

  Widget _buildProfileOption({
    required String title,
    required String description,
    required IconData icon,
    required String value,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedProfile = value;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedProfile == value ? Colors.blue[900]! : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: _selectedProfile,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedProfile = newValue!;
                });
              },
              activeColor: Colors.blue[900],
            ),
            SizedBox(width: 10,),
            Icon(
              icon,
              size: 40,
              color: _selectedProfile == value ? Colors.blue[900] : Colors.black,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}