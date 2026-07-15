import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Center(
        child: Container(
        
          height: screenHeight * 0.5,
          width: screenWidth  * 0.5,
          color: Colors.blueAccent,
            child: Column(
              children: [
                Text('screen width $screenWidth' , style: TextStyle(fontSize: 25)),
                Text('screen height $screenHeight' , style: TextStyle(fontSize: 25)),
              ],
            ),
        ),
      ),
    );
  }
}
