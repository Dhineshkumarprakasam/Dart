import 'package:flutter/material.dart';

class dismissible extends StatefulWidget {
  const dismissible({super.key});

  @override
  State<dismissible> createState() => _dismissibleState();
}

class _dismissibleState extends State<dismissible> {
  List<String> arr = ["hello", "world", "welcome", "thank you"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: arr.length,
        itemBuilder: (context, index) {
          final cont = arr[index];
          return Dismissible(
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(cont)));
              }
            },

            key: Key(cont),
            child: Card(child: ListTile(title: Text(cont))),
            background: Container(color: Colors.red),
            secondaryBackground: Container(color: Colors.green),
          );
        },
      ),
    );
  }
}
