import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebace_practice/model/firebase_response_model.dart';

enum PostDataType { ADD, SET, UPDATE }

class FirebaseFunction {
  Future<dynamic> post(
      dynamic path, Map<String, dynamic> data, PostDataType type) async {
    try {
      if (path is DocumentReference) {
        if (type == PostDataType.SET) {
          await path.set(data);
        } else {
          await path.update(data);
        }
      } else {
        final response = await (path as CollectionReference).add(data);
        return FirebaseResponseModel(data, response.id);
      }
    } catch (e) {
      rethrow;
    }
  }
}
