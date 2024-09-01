import 'package:firebace_practice/Controller/product_controller.dart';
import 'package:firebace_practice/model/product_model.dart';
import 'package:firebace_practice/screen/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TimeOfDay _selctTime = TimeOfDay.now();
  bool? _selectedisActive;
  String? _selectedcolor;
  String? _selectedsize;
  TextEditingController stockLevelcontroler = TextEditingController();

  TextEditingController namecontroler = TextEditingController();
  TextEditingController prizecontroler = TextEditingController();
  TextEditingController descriptioncontroler = TextEditingController();
  TextEditingController categorycontroler = TextEditingController();
  TextEditingController sellername = TextEditingController();
  TextEditingController sellerphone = TextEditingController();
  TextEditingController selleremail = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();
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
                                      provider.addvariant(ProductVariantsModel(
                                          color: _selectedcolor,
                                          size: _selectedsize,
                                          stockLevel: int.parse(
                                              stockLevelcontroler.text)));
                                      Navigator.pop(context);
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
                provider.variantdata.length,
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
                        Text("color:  ${provider.variantdata[index].color}"),
                        Text("size:  ${provider.variantdata[index].size}"),
                        Text(
                            "stockLevel:  ${provider.variantdata[index].stockLevel}")
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        provider.removevariant(provider.variantdata[index]);
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
              keyboardType: TextInputType.number,
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
                ProductController().setProduct(ProductModel(
                    product_name: namecontroler.text,
                    product_price: double.parse(prizecontroler.text),
                    product_description: descriptioncontroler.text,
                    product_category: categorycontroler.text,
                    product_createdAt: _selctTime.toString(),
                    product_inStock: _selectedisActive,
                    product_variants: provider.variantdata,
                    seller: SellerModel(
                        seller_name: sellername.text,
                        seller_PhoneNumber: int.parse(sellerphone.text),
                        seller_email: selleremail.text,
                        address: AddressModel(
                            city: city.text,
                            state: state.text,
                            pinCode: int.parse(pincode.text)))));
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
