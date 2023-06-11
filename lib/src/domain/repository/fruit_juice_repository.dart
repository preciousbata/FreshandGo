import 'package:restaurant_app/src/domain/entity/fruit_juice_entity.dart';

abstract class FruitJuiceRepository {
  Stream<List<FruitJuiceEntity>> get fruitJuice;
}
