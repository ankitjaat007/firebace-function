import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebace_practice/Controller/product_controller.dart';
import 'package:flutter/material.dart';

class StreamBuilderScreen extends StatelessWidget {
  StreamBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: ProductController().getDataStrim(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            final data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text(item['product_name']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
