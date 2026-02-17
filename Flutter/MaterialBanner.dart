import 'package:flutter/material.dart';

void showBanner(BuildContext context) {
  ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      content: Text("Subscribe", style: TextStyle(color: Colors.white)),
      elevation: 5,
      backgroundColor: Colors.black,
      actions: [
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          child: Text("Dismiss", style: TextStyle(color: Colors.blueAccent)),
        ),
      ],
    ),
  );
}

class NotificationMaterialBanner extends StatelessWidget {
  const NotificationMaterialBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Banner"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showBanner(context),
          child: Text("Material Banner"),
        ),
      ),
    );
  }
}
