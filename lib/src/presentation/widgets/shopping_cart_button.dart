import 'package:flutter/material.dart';
import 'package:restaurant_app/src/domain/entity/user_entity.dart';

class ShopppingCartBuuton extends StatelessWidget {
  const ShopppingCartBuuton({
    super.key,
    required this.width,
    required this.onPressed,
  });

  final double width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FloatingActionButton.extended(
          onPressed: onPressed,
          backgroundColor: Colors.green.withOpacity(0.9),
          label: const Icon(Icons.shopping_cart_checkout_outlined)),
      Positioned(
        left: 51,
        child: currentUser.cartItems.isEmpty
            ? const SizedBox.shrink()
            : CircleAvatar(
                backgroundColor: Colors.red,
                radius: width * 0.013,
              ),
      ),
    ]);
  }
}
