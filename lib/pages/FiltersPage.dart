import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FiltersPage(),
  ));
}

class FiltersPage extends StatefulWidget {
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  DateTime selectedDate = DateTime.now(); // Selected date for filtering

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Filters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filters',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            buildSearchField(),
            SizedBox(height: 16.0),
            buildDateSelector(),
            SizedBox(height: 16.0),
            buildStateForm(),
            SizedBox(height: 16.0),
            buildTimeInput(),
            SizedBox(height: 16.0),
            buildVehicleTypeInput(),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle filtering and displaying results here
                // You can fetch and display the results based on the selected filters
              },
              child: Text('Search'),
            ),
            SizedBox(height: 16.0),
            buildResults(),
          ],
        ),
      ),
    );
  }

  Widget buildSearchField() {
    // Implement your search field widget here
    return TextField(
      decoration: InputDecoration(
        labelText: 'Search',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildDateSelector() {
    // Implement your date selection widget here
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Date',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        InkWell(
          onTap: () {
            _selectDate(context);
          },
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 8.0),
                Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Widget buildStateForm() {
    // Implement your State Form widget here
    return TextField(
      decoration: InputDecoration(
        labelText: 'State Form',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildTimeInput() {
    // Implement your time input widget here
    return TextField(
      decoration: InputDecoration(
        labelText: 'Time',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildVehicleTypeInput() {
    // Implement your vehicle type input widget here
    return TextField(
      decoration: InputDecoration(
        labelText: 'Vehicle Type',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildResults() {
    // Implement your results display widget here
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Results',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        // Display the results based on the selected filters here
        buildResultItem(
          name: 'Shahzib Jugwal',
          availability: 'Available',
          date: 'Date : 25 July 2023',
        ),
        // Add more result items as needed
      ],
    );
  }

  Widget buildResultItem({
    required String name,
    required String availability,
    required String date,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                availability,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color:
                      availability == 'Available' ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                date,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
