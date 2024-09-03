import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApis {
  static final _firestore = FirebaseFirestore.instance;

  // Collection
  static CollectionReference productCollectionRef =
      _firestore.collection("product");

  // Document References
  static DocumentReference productDocumentRef(String id) =>
      productCollectionRef.doc(id);
}
