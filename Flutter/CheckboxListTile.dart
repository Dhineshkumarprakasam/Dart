import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox list tile"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: Center(
          child: CheckboxListTile(
            title: Text("Agree for terms and conditions"),
            controlAffinity: ListTileControlAffinity.leading,
            value: _value,
            onChanged: (bool? value) {
              setState(() {
                _value = value ?? false;
              });
            },
          ),
        ),
      ),
    );
  }
}
