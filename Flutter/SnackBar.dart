import 'package:flutter/material.dart';

class snackBar extends StatelessWidget {
  const snackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  showCloseIcon: true,
                  duration: const Duration(seconds: 2),
                  content: Text("its a snackbar"),
                  backgroundColor: Colors.amber,
                  closeIconColor: Colors.white,
                ),
              );
            },
            child: Text("Show Snackbar"),
          ),
        ),
      ),
    );
  }
}
