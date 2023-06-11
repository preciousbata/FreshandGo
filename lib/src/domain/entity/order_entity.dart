import 'package:restaurant_app/src/domain/entity/cup_size_entity.dart';
import 'package:restaurant_app/src/domain/entity/delivery_mode_entity.dart';

class OrderEntity {
  final DeliveryModeEntity deliveryMode;
  final CupSizeEntity cupSize;
  final String juiceName;
  final String imageUrl;
  int qty;
  int total;

  OrderEntity(
      {required this.deliveryMode,
      required this.cupSize,
      required this.juiceName,
      required this.imageUrl,
      required this.total,
      required this.qty});
}
