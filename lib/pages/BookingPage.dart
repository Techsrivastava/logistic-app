import 'package:flutter/material.dart';

import 'package:test/pages/calendor_page.dart';

void main() {
  runApp(MaterialApp(
    home: BookingPage(),
  ));
}

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController fromStateController = TextEditingController();
  final TextEditingController toStateController = TextEditingController();
  final TextEditingController fromDistrictController = TextEditingController();
  final TextEditingController toDistrictController = TextEditingController();
  final TextEditingController requiredDateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  void dispose() {
    fromStateController.dispose();
    toStateController.dispose();
    fromDistrictController.dispose();
    toDistrictController.dispose();
    requiredDateController.dispose();
    timeController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTextField("From State", fromStateController),
            SizedBox(height: 16.0),
            buildTextField("To State", toStateController),
            SizedBox(height: 16.0),
            buildTextField("From District", fromDistrictController),
            SizedBox(height: 16.0),
            buildTextField("To District", toDistrictController),
            SizedBox(height: 16.0),
            buildTextField("Required Date", requiredDateController),
            SizedBox(height: 16.0),
            buildTextField("Time", timeController),
            SizedBox(height: 16.0),
            buildTextField("Note (if any)", noteController),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CalendarPage()));
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.0),
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
