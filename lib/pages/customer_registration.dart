import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/BookingFilterPage.dart';

class CustomerRegistrationForm extends StatefulWidget {
  const CustomerRegistrationForm({Key? key}) : super(key: key);

  @override
  _CustomerRegistrationFormState createState() =>
      _CustomerRegistrationFormState();
}

class _CustomerRegistrationFormState extends State<CustomerRegistrationForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _whatsappNumberController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _notInListController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Registration Form'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Full Name:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(
                hintText: 'Enter your full name',
                filled: true, // Set background to white
                border: OutlineInputBorder(), // Add border
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'WhatsApp Number:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _whatsappNumberController,
              decoration: InputDecoration(
                hintText: 'Enter your WhatsApp number',
                filled: true, // Set background to white
                border: OutlineInputBorder(), // Add border
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'State:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _stateController,
              decoration: InputDecoration(
                hintText: 'Enter your state',
                filled: true, // Set background to white
                border: OutlineInputBorder(), // Add border
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'District:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _districtController,
              decoration: InputDecoration(
                hintText: 'Enter your district',
                filled: true, // Set background to white
                border: OutlineInputBorder(), // Add border
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Not In List (Specify Here):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _notInListController,
              decoration: InputDecoration(
                hintText: 'Specify here',
                filled: true, // Set background to white
                border: OutlineInputBorder(), // Add border
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'OTP Verification:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _otpController,
              decoration: InputDecoration(
                hintText: 'Enter OTP',
                filled: true, // Set background to white
                border: OutlineInputBorder(), // Add border
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Handle OTP verification here
                final String otp = _otpController.text;
                // Perform OTP verification logic
                // You can access other form field values using the corresponding controllers
              },
              child: Text('Generate OTP'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookingFilterPage()));
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _whatsappNumberController.dispose();
    _stateController.dispose();
    _districtController.dispose();
    _notInListController.dispose();
    _otpController.dispose();
    super.dispose();
  }
}
