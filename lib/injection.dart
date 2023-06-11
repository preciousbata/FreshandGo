import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_app/src/data/repository/fruit_juice_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  sl.registerLazySingleton<FruitJuiceRepoImpl>(
      () => FruitJuiceRepoImpl(sl.get()));
}
