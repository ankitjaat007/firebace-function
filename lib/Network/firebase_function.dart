import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebace_practice/model/firebase_response_model.dart';

class FirebaseFunction {
  Future<dynamic> post(dynamic path, Map<String, dynamic> data) async {
    try {
      if (path is DocumentReference) {
        await path.set(data);
      } else {
        final response = await (path as CollectionReference).add(data);
        return FirebaseResponseModel(data, response.id);
      }
    } catch (e) {
      rethrow;
    }
  }
}
