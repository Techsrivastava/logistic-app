import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:test/pages/FiltersPage.dart';

class VehicleForm extends StatefulWidget {
  const VehicleForm({Key? key}) : super(key: key);

  @override
  _VehicleFormState createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  File? _vehiclePhoto;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>(); // Key for the form

  String _fullName = '';
  String _whatsappNumber = '';
  String _notInList =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.';

  String _selectedVehicleType = 'Truck';
  List<String> _vehicleTypes = ['Truck', 'Car', 'Motorcycle', 'Other'];

  String _selectedState = 'Maharashtra';
  List<String> _states = [
    'Maharashtra',
    'Karnataka',
    'Tamil Nadu',
    'Uttar Pradesh',
    'Bihar',
    'Gujarat',
    'Other'
  ];

  String _selectedDistrict = 'Mumbai';
  List<String> _districts = [
    'Mumbai',
    'Bengaluru',
    'Chennai',
    'Lucknow',
    'Patna',
    'Ahmedabad',
    'Other'
  ];

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _vehiclePhoto = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Registration Form'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign the key to the form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Personal Information:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  filled: true, // Set background to white
                  border: OutlineInputBorder(), // Add border
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _fullName = value!;
                },
              ),
              SizedBox(height: 16.0), // Add space between form fields
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'WhatsApp Number',
                  filled: true, // Set background to white
                  border: OutlineInputBorder(), // Add border
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your WhatsApp number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _whatsappNumber = value!;
                },
              ),
              SizedBox(height: 16.0), // Add space between form fields
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Not In List (Specify Here)',
                  filled: true, // Set background to white
                  border: OutlineInputBorder(), // Add border
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please specify';
                  }
                  return null;
                },
                onSaved: (value) {
                  _notInList = value!;
                },
              ),

              SizedBox(height: 24.0), // Add more space

              const Text(
                'Vehicle Information:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                value: _selectedVehicleType,
                items: _vehicleTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedVehicleType = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Vehicle Type',
                  filled: true, // Set background to white
                  border: OutlineInputBorder(), // Add border
                ),
              ),
              SizedBox(height: 16.0), // Add space between form fields
              DropdownButtonFormField<String>(
                value: _selectedState,
                items: _states.map((String state) {
                  return DropdownMenuItem<String>(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedState = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'State',
                  filled: true, // Set background to white
                  border: OutlineInputBorder(), // Add border
                ),
              ),
              SizedBox(height: 16.0), // Add space between form fields
              DropdownButtonFormField<String>(
                value: _selectedDistrict,
                items: _districts.map((String district) {
                  return DropdownMenuItem<String>(
                    value: district,
                    child: Text(district),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedDistrict = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'District',
                  filled: true, // Set background to white
                  border: OutlineInputBorder(), // Add border
                ),
              ),

              SizedBox(height: 24.0), // Add more space

              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Upload Vehicle Photo'),
              ),

              if (_vehiclePhoto != null)
                Image.file(_vehiclePhoto!, height: 200),

              SizedBox(
                  height: 16.0), // Add space between the image and the button

              ElevatedButton(
                onPressed: () {
                  // Validate the form
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FiltersPage())); // Save form values

                    // Handle form submission here, including uploading the vehicle photo
                    // Form values are available in _fullName, _selectedVehicleType, _selectedState, etc.
                    // _vehiclePhoto can be used to access the selected image file.
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
