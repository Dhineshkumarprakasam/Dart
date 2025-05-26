import 'package:flutter/material.dart';

class gridView extends StatelessWidget {
  const gridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> arr = ["hello", "world", "welcome", "thank you"];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.all(10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
          ),
          children: [
            for (int i = 0; i < arr.length; i++) ...[
              Card(child: Center(child: Text(arr[i]))),
            ],
          ],
        ),
      ),
    );
  }
}
