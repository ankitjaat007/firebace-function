import 'package:firebace_practice/Controller/product_controller.dart';
import 'package:firebace_practice/model/product_model.dart';
import 'package:firebace_practice/screen/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddData extends StatefulWidget {
  ProductModel? productModel;
  AddData({super.key, this.productModel});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TimeOfDay _selctTime = TimeOfDay.now();
  bool? _selectedisActive;
  String? _selectedcolor;
  String? _selectedsize;
  TextEditingController stockLevelcontroler = TextEditingController();

  final namecontroler = TextEditingController();
  final prizecontroler = TextEditingController();
  final descriptioncontroler = TextEditingController();
  final categorycontroler = TextEditingController();
  final sellername = TextEditingController();
  final sellerphone = TextEditingController();
  final selleremail = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final pincode = TextEditingController();
  List<ProductVariantsModel> productVariant = [];

  @override
  void initState() {
    super.initState();
    textvalue();
  }

  textvalue() {
    if (widget.productModel != null) {
      // _selctTime =
      //     widget.productModel!.product_createdAt.toString() as TimeOfDay;
      productVariant = widget.productModel!.product_variants!;
      namecontroler.text = widget.productModel!.product_name.toString();
      prizecontroler.text = widget.productModel!.product_price.toString();
      descriptioncontroler.text =
          widget.productModel!.product_description.toString();
      categorycontroler.text = widget.productModel!.product_category.toString();
      sellername.text = widget.productModel!.seller!.seller_name.toString();
      _selectedisActive = widget.productModel!.product_inStock;
      sellerphone.text =
          widget.productModel!.seller!.seller_PhoneNumber.toString();
      selleremail.text = widget.productModel!.seller!.seller_email.toString();
      city.text = widget.productModel!.seller!.address!.city.toString();
      state.text = widget.productModel!.seller!.address!.state.toString();
      pincode.text = widget.productModel!.seller!.address!.pinCode.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context);
    // print(provider.variantdata.length);
    // print("***************************");
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: namecontroler,
                    decoration:
                        const InputDecoration(labelText: "Product name"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: prizecontroler,
                    decoration:
                        const InputDecoration(labelText: "Product Prize"),
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: descriptioncontroler,
              decoration:
                  const InputDecoration(labelText: "product_description"),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: categorycontroler,
                    decoration:
                        const InputDecoration(labelText: "product_category"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: _selctTime,
                      );
                      if (timeOfDay != null) {
                        setState(() {
                          _selctTime = timeOfDay;
                        });
                        print(_selctTime);
                      }
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${_selctTime.hour}:${_selctTime.minute}"),
                          Icon(Icons.watch_later_outlined)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButton<bool>(
              value: _selectedisActive,
              hint: Text("product inStock"),
              items: [
                DropdownMenuItem(
                  value: true,
                  child: Text('Yes'),
                ),
                DropdownMenuItem(
                  value: false,
                  child: Text('No'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedisActive = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add product variants"),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DropdownButton<String>(
                                  value: _selectedcolor,
                                  hint: Text('Select a color'),
                                  items: DummyData()
                                      .variantsColor
                                      .map((String name) {
                                    return DropdownMenuItem<String>(
                                      value: name,
                                      child: Text(name),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedcolor = newValue;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                DropdownButton<String>(
                                  value: _selectedsize,
                                  hint: Text('Select a Size'),
                                  items: DummyData()
                                      .variantsSize
                                      .map((String name) {
                                    return DropdownMenuItem<String>(
                                      value: name,
                                      child: Text(name),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedsize = newValue;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("stockLevel"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                        child: TextField(
                                      controller: stockLevelcontroler,
                                      keyboardType: TextInputType.number,
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextButton(
                                    onPressed: () {
                                      final data = ProductVariantsModel(
                                          color: _selectedcolor,
                                          size: _selectedsize,
                                          stockLevel: int.parse(
                                              stockLevelcontroler.text));
                                      productVariant.add(data);
                                      Navigator.pop(context);
                                      _selectedcolor = null;
                                      _selectedsize = null;
                                      stockLevelcontroler.clear();
                                      setState(() {});
                                    },
                                    child: Text("add"))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.add_box_outlined))
              ],
            ),
            Wrap(children: [
              ...List.generate(
                productVariant.length,
                (index) => Stack(alignment: Alignment.topRight, children: [
                  Container(
                    color: Colors.blueGrey,
                    height: 90,
                    width: 120,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("color:  ${productVariant[index].color}"),
                        Text("size:  ${productVariant[index].size}"),
                        Text("stockLevel:  ${productVariant[index].stockLevel}")
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        productVariant.remove(productVariant[index]);
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.amber,
                      )),
                ]),
              ),
            ]),
            Text("seller data :"),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: sellername,
                  decoration: InputDecoration(label: Text("seller name")),
                )),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: TextField(
                  controller: sellerphone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label: Text("seller number")),
                ))
              ],
            ),
            TextField(
              controller: selleremail,
              decoration: InputDecoration(label: Text("seller email")),
            ),
            Text("seller address :"),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: city,
                  decoration: InputDecoration(label: Text("city")),
                )),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: TextField(
                  controller: state,
                  decoration: InputDecoration(label: Text("state")),
                ))
              ],
            ),
            TextField(
              controller: pincode,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(label: Text("pin code")),
            ),
            TextButton(
              onPressed: () {
                final newproduct = ProductModel(
                    product_name: namecontroler.text,
                    product_price: double.parse(prizecontroler.text),
                    product_description: descriptioncontroler.text,
                    product_category: categorycontroler.text,
                    product_createdAt: _selctTime.toString(),
                    product_inStock: _selectedisActive,
                    product_variants: productVariant,
                    seller: SellerModel(
                        seller_name: sellername.text,
                        seller_PhoneNumber: int.parse(sellerphone.text),
                        seller_email: selleremail.text,
                        address: AddressModel(
                            city: city.text,
                            state: state.text,
                            pinCode: int.parse(pincode.text))));
                widget.productModel == null
                    ? provider.addProduct(newproduct, context)
                    : provider.updateProduct(
                        newproduct, widget.productModel!.product_id!, context);
              },
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.greenAccent)),
              child: Text(
                "add data",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
