import 'package:firebace_practice/screen/add_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home page"),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddData()));
          },
          icon: CircleAvatar(radius: 30, child: Icon(Icons.add_circle))),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(10),
        children: [],
      )),
    );
  }
}
