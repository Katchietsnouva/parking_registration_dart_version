import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking Management System',
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  // Define your variables and controllers here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Your form fields go here using TextFormField, Checkbox, and other widgets
              // Example:
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                // Add controllers, validators, etc., as needed
              ),
              // Add other form fields, checkboxes, and buttons here
              ElevatedButton(
                onPressed: () {
                  // Handle button press (similar to your getvals function)
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
