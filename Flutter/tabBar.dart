import 'package:flutter/material.dart';

class tabBar extends StatelessWidget {
  const tabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab Bar"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          bottom: TabBar(
            indicatorColor: Colors.red,
            tabs: [
              Tab(text: "Tab 1", icon: Icon(Icons.access_alarm)),
              Tab(text: "Tab 2", icon: Icon(Icons.airplanemode_active)),
              Tab(text: "Tab 3", icon: Icon(Icons.chat)),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            Center(child: Text("Tab 1")),
            Center(child: Text("Tab 2")),
            Center(child: Text("Tab 3")),
          ],
        ),
      ),
    );
  }
}
