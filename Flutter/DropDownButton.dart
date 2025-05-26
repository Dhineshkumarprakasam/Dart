import 'package:flutter/material.dart';

class dropDown extends StatefulWidget {
  const dropDown({super.key});

  @override
  State<dropDown> createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {
  String selected = "Apple";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drop Down Button"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Container(
          width: 200,
          child: DropdownButton(
            isExpanded: true,
            value: selected,
            items: [
              DropdownMenuItem(child: Text("Apple"), value: "Apple"),
              DropdownMenuItem(child: Text("Mango"), value: "Mango"),
              DropdownMenuItem(child: Text("Banana"), value: "Banana"),
              DropdownMenuItem(child: Text("Orange"), value: "Orange"),
            ],

            onChanged: (String? val) {
              setState(() {
                selected = val!;
              });
            },
          ),
        ),
      ),
    );
  }
}
