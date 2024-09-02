import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebace_practice/Network/firebase_function.dart';
import 'package:firebace_practice/model/firebase_response_model.dart';
import 'package:firebace_practice/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  final _firebaseFunction = FirebaseFunction();
  final _firestore = FirebaseFirestore.instance;
  List<ProductModel> _productdata = [];
  List<ProductModel> get productdata => _productdata;

// set Variants

  List<ProductVariantsModel> _variant = [];
  List<ProductVariantsModel> get variantdata => _variant;

  addvariant(ProductVariantsModel variant) {
    _variant.add(variant);
    notifyListeners();
  }

  removevariant(ProductVariantsModel variant) {
    _variant.remove(variant);
    notifyListeners();
  }
  // SET DATA

  Future<void> setProduct(ProductModel model, BuildContext context) async {
    try {
      await _firebaseFunction
          .post(_firestore.collection("product"), model.toAddProduct())
          .then(
        (value) {
          _productdata.add(ProductModel.fromProduct(
              FirebaseResponseModel(model.toAddProduct(), value.id)));
          Navigator.pop(context);
        },
      );
    } catch (e) {
      print(e.toString());
    } finally {
      notifyListeners();
    }
  }

  // get data
  Future<void> getproduct() async {
    try {
      await _firestore.collection("product").get().then((value) {
        final snapshot = value.docs
            .map((e) =>
                ProductModel.fromProduct(FirebaseResponseModel(e.data(), e.id)))
            .toList();
        _productdata = snapshot;
      });
      print(productdata.length);
      print("====get product data====");
    } catch (e) {
      print(e.toString());
      print("get error===product===get error");
    } finally {
      notifyListeners();
    }
  }

  // update data
  Future<void> UpdateProduct(
      ProductModel model, String productId, BuildContext context) async {
    try {
      await _firestore
          .collection("product")
          .doc(productId)
          .update(model.toAddProduct())
          .then((value) => Navigator.pop(context));
      final index = _productdata.indexWhere(
        (element) => element.product_id == productId,
      );
      _productdata[index] = model;
      print("====update product data====");
    } catch (e) {
      print(e.toString());
      print("update error===product===update error");
    } finally {
      notifyListeners();
    }
  }

  // delet data on firebase
  Future<void> deletdata(String productId) async {
    try {
      await _firestore.collection("product").doc(productId).delete();
      _productdata.removeWhere((element) => element.product_id == productId);
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}
