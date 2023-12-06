import 'package:flutter/material.dart';
//import '/widgets/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0), // Add padding if needed
        child: Card(
          color: Colors.black,
          child: Container(
            width: screenHeight * 0.4, // Adjust width if needed
            height: screenHeight * 0.20, // Adjust height if needed
            // Add your card content here
            child: const Center(
              child: Text(
                'Card Content',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
