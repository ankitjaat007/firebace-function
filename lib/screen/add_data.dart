import 'package:firebace_practice/Controller/product_controller.dart';
import 'package:firebace_practice/model/product_model.dart';
import 'package:flutter/material.dart';

class AddData extends StatelessWidget {
  const AddData({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroler = TextEditingController();
    TextEditingController prizecontroler = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: namecontroler,
              decoration: const InputDecoration(labelText: "name"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: prizecontroler,
              decoration: const InputDecoration(labelText: "prize"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  // ProductController().setProduct(ProductModel(
                  //     name: namecontroler.text,
                  //     price: double.parse(prizecontroler.text)));
                },
                style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.greenAccent)),
                child: const Text("add data")),
          ],
        ),
      ),
    );
  }
}
