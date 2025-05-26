import "package:flutter/material.dart";

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            children: [
              DrawerHeader(
                child: Container(color: Colors.red),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Drawer"),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),

      body: Container(child: Center(child: Text("Drawer"))),
    );
  }
}
