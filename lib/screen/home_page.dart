import 'package:firebace_practice/Controller/product_controller.dart';
import 'package:firebace_practice/model/product_model.dart';
import 'package:firebace_practice/screen/add_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    data();
    super.initState();
  }

  data() async {}

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
        children: [
          Stack(alignment: Alignment.topRight, children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
              color: Colors.greenAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "shit",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "\$200",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      )
                    ],
                  ),
                  Text(
                    "good quailty",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "product inStock=",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "product all color",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  Wrap(
                    children: [
                      Text(
                        "red",
                        style: TextStyle(color: Colors.blueAccent),
                      )
                    ],
                  ),
                  Text(
                    "saller name : ${"ankit"}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "contact : ${"56465"}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "shop address:",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "city : ${"hisar"}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "state : ${"haryana"}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Text(
                    "pincode : ${"54465"}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "UpdatePost : ${"10/12/2003"}",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepPurpleAccent),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                        child: Icon(Icons.edit_calendar_outlined))),
                IconButton(
                    onPressed: () {},
                    icon:
                        CircleAvatar(child: Icon(Icons.delete_outline_rounded)))
              ],
            )
          ])
        ],
      )),
    );
  }
}
