import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebace_practice/Network/firebase_function.dart';
import 'package:firebace_practice/model/firebase_response_model.dart';
import 'package:firebace_practice/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  final _firebaseFunction = FirebaseFunction();
  final _firestore = FirebaseFirestore.instance;
  // final List<ProductModel> _productdata = [];
  // List<ProductModel> get productdata => _productdata;

  // SET DATA

  // Future<void> setProduct(ProductModel model) async {
  //   try {
  //     final response = _firebaseFunction.post(_firestore.collection("product"),
  //         model.toAddProduct(), PostDataType.ADD) as FirebaseResponseModel;
  //     if (response.docId.isNotEmpty) {
  //       ProductModel data = ProductModel.fromProduct(response);

  //       await _firebaseFunction.post(
  //           _firestore.collection("product").doc(response.docId),
  //           data.toAddProduct(),
  //           PostDataType.UPDATE);

  //       _productdata.add(data);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   } finally {
  //     notifyListeners();
  //   }
  // }
}
