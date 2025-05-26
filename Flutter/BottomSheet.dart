import 'package:flutter/material.dart';

class bottomSheet extends StatelessWidget {
  const bottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Sheet"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  height: 300,
                  child: Center(
                    child: GridView(
                      padding: EdgeInsets.all(20),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      children: [
                        Card(child: Center(child: Text("Button1"))),
                        Card(child: Center(child: Text("Button2"))),
                        Card(child: Center(child: Text("Button3"))),
                        Card(child: Center(child: Text("Button4"))),
                        Card(child: Center(child: Text("Button5"))),
                        Card(child: Center(child: Text("Button6"))),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text("Show Bottom Sheet"),
        ),
      ),
    );
  }
}
