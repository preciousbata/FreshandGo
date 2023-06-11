import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/src/data/data_source/remote_data_source.dart';
import 'package:restaurant_app/src/domain/entity/fruit_juice_entity.dart';
import 'package:restaurant_app/src/domain/repository/fruit_juice_repository.dart';

const _fruitJuice = 'fruitJuice';

class FruitJuiceRepoImpl implements FruitJuiceRepository {
  final FirebaseFirestore firebaseFirestore;

  FruitJuiceRepoImpl(this.firebaseFirestore);

  @override
  Stream<List<FruitJuiceEntity>> get fruitJuice =>
      FruitJuiceRemoteDataSourceImpl(firebaseFirestore)
          .getCollections(_fruitJuice)
          .map((event) => event.docs
              .map((e) => FruitJuiceEntity.fromJson(e.data()))
              .toList());
}
