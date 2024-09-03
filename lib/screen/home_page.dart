import 'package:firebace_practice/Controller/product_controller.dart';
import 'package:firebace_practice/screen/add_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  data() async {
    final db = Provider.of<ProductController>(context, listen: false);
    await db.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context);
    final product = provider.productdata;
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
          ...List.generate(
            provider.productdata.length,
            (index) => Stack(alignment: Alignment.topRight, children: [
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
                          "${product[index].product_name}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "\$${product[index].product_price}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        )
                      ],
                    ),
                    Text(
                      "${product[index].product_description}",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "product inStock=${product[index].product_inStock}",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "product avilable color",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    Wrap(
                      children: [
                        Text(
                          "${product[index].product_variants!.map(
                                (e) => e.color,
                              )}",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ],
                    ),
                    Text(
                      "saller name : ${"${product[index].seller!.seller_name}"}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "contact : ${"${product[index].seller!.seller_PhoneNumber}"}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "shop address:",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "city : ${product[index].seller!.address!.city}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "state : ${product[index].seller!.address!.state}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Text(
                      "pincode : ${product[index].seller!.address!.pinCode}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "UpdatePost : ${product[index].product_createdAt}",
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
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddData(
                            productModel: product[index],
                          ),
                        ));
                      },
                      icon: CircleAvatar(
                          child: Icon(Icons.edit_calendar_outlined))),
                  IconButton(
                      onPressed: () {
                        provider
                            .deletedata(product[index].product_id.toString());
                      },
                      icon: CircleAvatar(
                          child: Icon(Icons.delete_outline_rounded)))
                ],
              )
            ]),
          )
        ],
      )),
    );
  }
}
