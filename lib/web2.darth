import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _carNumberPlateController = TextEditingController();
  final TextEditingController _timeInController = TextEditingController();
  final TextEditingController _paymentModeController = TextEditingController();

  bool _rememberMe = false;
  int _customerNumber = 0;

  void _onFocusIn(TextEditingController controller, String defaultText) {
    if (controller.text == defaultText) {
      controller.clear();
    }
  }

  void _onFocusOut(TextEditingController controller, String defaultText) {
    if (controller.text.isEmpty) {
      controller.text = defaultText;
    }
  }

  void _checkFields() {
    bool allFilled = [
      _nameController.text,
      _phoneController.text,
      _genderController.text,
      _carNumberPlateController.text,
      _timeInController.text,
      _paymentModeController.text,
    ].every((text) => text != "");

    setState(() {
      _customerNumber++;
      _rememberMe = false;
      if (allFilled) {
        // Enable the submit button
      } else {
        // Disable the submit button
      }
    });
  }

  void _getVals() {
    Map<String, dynamic> customerData = {
      "Name": _nameController.text,
      "Phone": _phoneController.text,
      "Gender": _genderController.text,
      "Car Number Plate": _carNumberPlateController.text,
      "Time In": _timeInController.text,
      "Payment Mode": _paymentModeController.text,
    };

    // Write to JSON file
    String fileContent;
    try {
      fileContent = File("customerdb.json").readAsStringSync();
    } catch (e) {
      fileContent = "[]";
      File("customerdb.json").writeAsStringSync(fileContent);
    }

    List<dynamic> existingEntries = json.decode(fileContent);
    customerData["Customer Number"] = _customerNumber;
    existingEntries.add(customerData);

    File("customerdb.json").writeAsStringSync(json.encode(existingEntries));

    // Show success message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text("Customer number $_customerNumber data stored in customerdb.json"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );

    // Clear text fields
    _nameController.clear();
    _phoneController.clear();
    _genderController.clear();
    _carNumberPlateController.clear();
    _timeInController.clear();
    _paymentModeController.clear();

    // Disable the submit button
    // Call _checkFields to update the button state
    _checkFields();
  }

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
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Name goes here',
                ),
                onTap: () => _onFocusIn(_nameController, 'Name goes here'),
                onChanged: (text) => _checkFields(),
                onEditingComplete: () => _onFocusOut(_nameController, 'Name goes here'),
              ),
              // ... Repeat the same structure for other text fields

              CheckboxListTile(
                title: Text('Remember me?'),
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () => _getVals(),
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: _rememberMe ? Colors.blue : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
