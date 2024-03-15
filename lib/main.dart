// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Pressure Checker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BloodPressurePage(),
    );
  }
}

class BloodPressurePage extends StatefulWidget {
  const BloodPressurePage({Key? key}) : super(key: key);

  @override
  _BloodPressurePageState createState() => _BloodPressurePageState();
}

class _BloodPressurePageState extends State<BloodPressurePage> {
  TextEditingController systolicController = TextEditingController();
  TextEditingController diastolicController = TextEditingController();
  String classificationResult = '';

  void classifyBloodPressure() {
    int systolic = int.tryParse(systolicController.text) ?? 0;
    int diastolic = int.tryParse(diastolicController.text) ?? 0;

    if (systolic < 120 && diastolic < 80) {
      classificationResult = 'Normal';
    } else if (systolic >= 120 && systolic <= 129 && diastolic < 80) {
      classificationResult = 'Elevated';
    } else if ((systolic >= 130 && systolic <= 139) ||
        (diastolic >= 80 && diastolic <= 89)) {
      classificationResult = 'Hypertension Stage 1';
    } else if (systolic >= 140 || diastolic >= 90) {
      classificationResult = 'Hypertension Stage 2';
    } else {
      classificationResult = 'Hypertensive crisis (Seek medical attention)';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Pressure Classifier'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.blueAccent
              ], // Use Colors.blue and Colors.green or other colors as needed
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.blueAccent
            ], // Use Colors.blue and Colors.green or other colors as needed
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                key: const Key('systolic'),
                controller: systolicController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Systolic Blood Pressure'),
              ),
              const SizedBox(height: 16.0),
              TextField(
                key: const Key('diastolic'),
                controller: diastolicController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Diastolic Blood Pressure'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                key: const Key('examine'),
                onPressed: classifyBloodPressure,
                child: const Text('Examine'),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Classification Result: $classificationResult',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
