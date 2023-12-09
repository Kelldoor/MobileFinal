import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to DogFax! Here, you can explore a collection of information about various dog breeds and select specific breeds of your choice.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Text(
                'The provided information includes details such as breed name, lifespan (maximum and minimum), weight (for both genders), and relationships to other dogs.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Text(
                'Why use DogFax?\n\n'
                '1. Discover Information: Learn about various dog breeds, including their names, lifespans, weights, and relationships with other dogs.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16.0),
              Text(
                '2. Stay Informed: Keep up-to-date with the latest information on different dog breeds.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16.0),
              Text(
                'Developed by Brady Peters for CMSC 2204.',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
