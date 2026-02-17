import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final list = ["Apple", "Banana", "Orange", "Grapes", "Lemon"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reorderable List"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: ReorderableListView.builder(
          itemBuilder: (context, i) {
            return Card(
              key: ValueKey(list[i]),
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: ListTile(
                trailing: Icon(Icons.drag_handle),
                tileColor: Colors.black,
                title: Text(list[i]),
                textColor: Colors.white,
              ),
            );
          },
          itemCount: list.length,
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final item = list.removeAt(oldIndex);
              list.insert(newIndex, item);
            });
          },
        ),
      ),
    );
  }
}
