import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebace_practice/Network/firebase_function.dart';
import 'package:firebace_practice/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  final _firebaseFunction = FirebaseFunction();
  final _firestore = FirebaseFirestore.instance;
  final List<ProductModel> _productdata = [];
  List<ProductModel> get productdata => _productdata;

  // lodding circle
  bool _loding = false;
  bool get getLoding => _loding;
  setLoader(bool value) {
    _loding = value;
    notifyListeners();
  }

// set Variants

  List<ProductVariantsModel> _variant = [];
  List<ProductVariantsModel> get variantdata => _variant;

  // setvariant(List<ProductVariantsModel> model) {
  //   _variant = model;
  //   notifyListeners();
  // }

  addvariant(ProductVariantsModel variant) {
    _variant.add(variant);
    notifyListeners();
  }

  removevariant(ProductVariantsModel variant) {
    _variant.remove(variant);
    notifyListeners();
  }
  // SET DATA

  Future<void> setProduct(ProductModel model) async {
    try {
      setLoader(true);
      await _firebaseFunction.post(
          _firestore.collection("product"), model.toAddProduct());
    } catch (e) {
      setLoader(false);
      print(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
