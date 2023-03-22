import 'package:alcala_03_trial/form_sample.dart';
import 'package:alcala_03_trial/input_field_sample.dart';
import 'package:flutter/material.dart';
import 'button_sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Interactivity Sample"),
        ),
        body: ListView(
          children: [
            ButtonSample(),
            FormSample()
          ],
        ),
      ),
    );
  }
}
