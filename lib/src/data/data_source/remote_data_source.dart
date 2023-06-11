import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RemoteDataScource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getCollections(
      String collectionPath);
}

class FruitJuiceRemoteDataSourceImpl implements RemoteDataScource {
  final FirebaseFirestore firebaseFirestore;
  FruitJuiceRemoteDataSourceImpl(this.firebaseFirestore);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getCollections(
      String collectionPath) {
    return firebaseFirestore.collection(collectionPath).snapshots();
  }
}
