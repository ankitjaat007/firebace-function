import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebace_practice/model/firebase_response_model.dart';

class FirebaseFunction {
  // POST DATA FUNCTION
  Future<FirebaseResponseModel?> post(
      dynamic path, Map<String, dynamic> data) async {
    FirebaseResponseModel? result;
    try {
      if (path is DocumentReference) {
        await path.set(data);
      } else {
        final response = await (path as CollectionReference).add(data);
        result = FirebaseResponseModel(data, response.id);
      }
    } catch (e) {
      rethrow;
    }
    return result;
  }

  // GET DATA FUNCTION
  Future<dynamic> get(dynamic path) async {
    try {
      if (path is CollectionReference) {
        return await _collectionGetData(path);
      } else if (path is DocumentReference) {
        return await _documentGetData(path);
      } else {
        return _queryGetData(path as Query);
      }
    } catch (e) {
      rethrow;
    }
  }

// UPDATE DATA FUNCTION
  Future<void> upDate(dynamic path, Map<String, dynamic> data) async {
    try {
      if (path is DocumentReference) {
        await path.update(data);
      }
    } catch (e) {
      rethrow;
    }
  }

  // DELETE DATA FUNCTION
  Future<void> deleteData(dynamic path) async {
    try {
      if (path is DocumentReference) {
        await path.delete();
      }
    } catch (e) {
      rethrow;
    }
  }
}

// COLLECTION GET
Future<List<FirebaseResponseModel>> _collectionGetData(
    CollectionReference reff) async {
  List<FirebaseResponseModel> db = [];
  try {
    final data = await reff.get();
    db = data.docs.map((e) => FirebaseResponseModel.response(e)).toList();
  } catch (e) {
    rethrow;
  }
  return db;
}

// DOCUMENT GET
Future<FirebaseResponseModel> _documentGetData(DocumentReference reff) async {
  try {
    final data = await reff.get();
    return FirebaseResponseModel.response(data);
  } catch (e) {
    rethrow;
  }
}

// QUERY GET
Future<List<FirebaseResponseModel>> _queryGetData(Query reff) async {
  List<FirebaseResponseModel> db = [];
  try {
    final data = await reff.get();
    db = data.docs.map((e) => FirebaseResponseModel.response(e)).toList();
  } catch (e) {
    rethrow;
  }
  return db;
}
