import 'package:restaurant_app/src/domain/entity/order_entity.dart';

class UserEntity {
  final Map<String, OrderEntity> cartItems;

  UserEntity(this.cartItems);

  UserEntity removeItem(String itemName) {
    if (cartItems.containsKey(itemName)) {
      cartItems.removeWhere((key, _) => key == itemName);
    }
    return UserEntity(cartItems);
  }

  UserEntity updateCart(String itemName, int qty) {
    if (cartItems.containsKey(itemName)) {
      OrderEntity order = cartItems[itemName]!;
      order.qty = qty;
      cartItems[itemName] = order;
    }
    return UserEntity(cartItems);
  }

  int get grandTotal {
    return cartItems.values
        .map((e) => e.total)
        .fold(0, (a, b) => a.toInt() + b.toInt());
  }

  void addToCart(String name, OrderEntity order) {
    cartItems[name] = order;
  }

  @override
  String toString() {
    return 'User{cartItems: $cartItems}';
  }
}

final currentUser = UserEntity({});
