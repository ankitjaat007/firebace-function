import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebace_practice/Network/firebase_api.dart';
import 'package:firebace_practice/Network/firebase_function.dart';
import 'package:firebace_practice/model/firebase_response_model.dart';
import 'package:firebace_practice/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  final _firebaseFunction = FirebaseFunction();

  List<ProductModel> _productdata = [];
  List<ProductModel> get productdata => _productdata;

  // Add a product
  Future<void> addProduct(ProductModel product, BuildContext context) async {
    try {
      final response = await _firebaseFunction.post(
          FirebaseApis.productCollectionRef, product.toAddProduct());

      if (response!.docId.isNotEmpty) {
        final data = ProductModel.fromProduct(response);
        _productdata.add(data);
        // Navigator.pop(context);
        notifyListeners();
      }
    } catch (e) {
      print("===== ${e.toString()}======");
    }
  }

  // get product from firebase
  Future<void> fetchProducts() async {
    try {
      var respose =
          await _firebaseFunction.get(FirebaseApis.productCollectionRef)
              as List<FirebaseResponseModel>;

      if (respose.isNotEmpty) {
        var snapshot = respose.map((e) => ProductModel.fromProduct(e)).toList();
        _productdata = snapshot;

        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  // update product from firebase
  Future<void> updateProduct(
      ProductModel product, String productId, BuildContext context) async {
    try {
      await _firebaseFunction.upDate(
          FirebaseApis.productDocumentRef(productId), product.toAddProduct());

      final index = _productdata.indexWhere(
        (element) => element.product_id == productId,
      );
      _productdata[index] = product;
      Navigator.pop(context);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // delete data on firebase
  Future<void> deletedata(String productId) async {
    try {
      await _firebaseFunction
          .deleteData(FirebaseApis.productDocumentRef(productId));

      _productdata.removeWhere((element) => element.product_id == productId);

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  final firebaseservice = FirebaseFirestore.instance;
// havey call in firebase for dlt the multiple product id
  // Future<void> multipleDlt(List<String> productId) async {
  //   try {
  //     for (var id in productId) {
  //       await _firebaseFunction.deleteData(FirebaseApis.productDocumentRef(id));

  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

// batch call in firebase for dlt the multiple product
  Future<void> multipleDltwithbatch(List<String> productId) async {
    final batch = firebaseservice.batch();

    try {
      for (var id in productId) {
        batch.delete(FirebaseApis.productDocumentRef(id));
        _productdata.removeWhere((e) => e.product_id == id);
      }
      await batch.commit();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

// batch call in firebase for update the multiple product
}
