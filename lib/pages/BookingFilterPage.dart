import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/BookingPage.dart';

class BookingFilterPage extends StatefulWidget {
  @override
  _BookingFilterPageState createState() => _BookingFilterPageState();
}

class _BookingFilterPageState extends State<BookingFilterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedStateFrom = 'Andhra Pradesh';
  String selectedStateTo = 'Andhra Pradesh';
  String selectedDistrictFrom = 'Chittoor';
  String selectedDistrictTo = 'Chittoor';
  String selectedVehicleType = 'Truck';
  List<String> filteredResults = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Filters'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filters',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
              SizedBox(height: 16.0),

              Text(
                'Search Date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildDateInput(),

              SizedBox(height: 16.0),

              Text(
                'State From (India)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildStateFromDropdown(),

              SizedBox(height: 16.0),

              Text(
                'State To (India)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildStateToDropdown(),

              SizedBox(height: 16.0),

              Text(
                'District From (India)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildDistrictFromDropdown(),

              SizedBox(height: 16.0),

              Text(
                'District To (India)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildDistrictToDropdown(),

              SizedBox(height: 16.0),

              Text(
                'Time',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildTimeInput(),

              SizedBox(height: 16.0),

              Text(
                'Vehicle Type',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildVehicleTypeDropdown(),

              SizedBox(height: 24.0),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle filter and show results here
                    showResults();
                  }
                },
                child: Text('Show Results'),
              ),

              SizedBox(height: 16.0),

              // Display the results here
              Text(
                'Results:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildResults(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper functions to build input fields with borders and white background

  Widget buildDateInput() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(
            "${selectedDate.toLocal()}".split(' ')[0],
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 20.0),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text('Select Date'),
          ),
        ],
      ),
    );
  }

  Widget buildStateFromDropdown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: DropdownButtonFormField<String>(
        value: selectedStateFrom,
        items: <String>[
          'Andhra Pradesh',
          'Karnataka',
          'Tamil Nadu',
          'Telangana',
          // Add more Indian states here
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedStateFrom = value!;
          });
        },
      ),
    );
  }

  Widget buildStateToDropdown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: DropdownButtonFormField<String>(
        value: selectedStateTo,
        items: <String>[
          'Andhra Pradesh',
          'Karnataka',
          'Tamil Nadu',
          'Telangana',
          // Add more Indian states here
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedStateTo = value!;
          });
        },
      ),
    );
  }

  Widget buildDistrictFromDropdown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: DropdownButtonFormField<String>(
        value: selectedDistrictFrom,
        items: <String>[
          'Chittoor',
          'Bengaluru',
          'Chennai',
          'Hyderabad',
          // Add more Indian districts here
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedDistrictFrom = value!;
          });
        },
      ),
    );
  }

  Widget buildDistrictToDropdown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: DropdownButtonFormField<String>(
        value: selectedDistrictTo,
        items: <String>[
          'Chittoor',
          'Bengaluru',
          'Chennai',
          'Hyderabad',
          // Add more Indian districts here
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedDistrictTo = value!;
          });
        },
      ),
    );
  }

  Widget buildTimeInput() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(
            selectedTime.format(context),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 20.0),
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: Text('Select Time'),
          ),
        ],
      ),
    );
  }

  Widget buildVehicleTypeDropdown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: DropdownButtonFormField<String>(
        value: selectedVehicleType,
        items: <String>[
          'Truck',
          'Car',
          'Motorcycle',
          'Other',
          // Add more vehicle types here
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedVehicleType = value!;
          });
        },
      ),
    );
  }

  List<Widget> buildResults() {
    List<Widget> resultWidgets = [];

    for (String result in filteredResults) {
      resultWidgets.add(
        GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => BookingPage())),
          child: Container(
            margin: EdgeInsets.only(bottom: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: $result',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Availability: Available',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Date: 25 July 2023',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return resultWidgets;
  }

  void showResults() {
    // This is where you can handle the filter and populate filteredResults with data.
    // For demonstration purposes, let's add a sample result.
    filteredResults.add('Shahzib Jugwal');

    // Remember to clear the previous results if needed.
    // filteredResults.clear();

    setState(() {});
  }
}

void main() {
  runApp(MaterialApp(
    home: BookingFilterPage(),
  ));
}
