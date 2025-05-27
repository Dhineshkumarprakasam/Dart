import 'package:flutter/material.dart';

class stack extends StatelessWidget {
  const stack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),

      body: Container(
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Container(height: 300, width: 200, color: Colors.blue),
              ),

              Center(
                child: Container(color: Colors.red, height: 400, width: 100),
              ),

              Center(
                child: Container(height: 100, width: 300, color: Colors.yellow),
              ),

              Center(
                child: Container(height: 50, width: 50, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
