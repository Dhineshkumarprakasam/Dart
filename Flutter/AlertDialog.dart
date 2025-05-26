import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showdialog(context);
          },
          child: Text("Alert Box"),
        ),
      ),
    );
  }
}

Future<void> showdialog(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text("Exit App"),
        content: Text("Are you sure want to exit this app ?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("No"),
          ),
        ],
      );
    },
  );
}
