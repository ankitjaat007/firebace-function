import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseResponseModel {
  Map<String, dynamic> data;
  String docId;
  FirebaseResponseModel(this.data, this.docId);

  FirebaseResponseModel.response(DocumentSnapshot snapshot)
      : docId = snapshot.id,
        data = snapshot.data() as Map<String, dynamic>;
}
