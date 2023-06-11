import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_app/src/core/contants.dart';
import 'package:restaurant_app/src/domain/entity/order_entity.dart';
import 'package:restaurant_app/src/domain/entity/user_entity.dart';
import 'package:restaurant_app/src/presentation/widgets/fruit_circle_avatar.dart';

class ShoppingCartScreen extends StatefulWidget {
  static const routeName = '/shopping_cart_screen';
  const ShoppingCartScreen({
    super.key,
  });

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    UserEntity user = currentUser;

    buildCartList(OrderEntity? order) {
      return Padding(
        padding:
            const EdgeInsets.only(top: 25.0, left: 10, right: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FruitCircleAvatar(width: width * 0.05, imageUrl: order!.imageUrl),
            Text(
              order.juiceName.toUpperCase(),
              style: TextStyle(
                  fontSize: 16,
                  color: PRIMARY_COLOR,
                  fontWeight: FontWeight.w600),
            ),
            Image.asset(order.cupSize.imageUrl),
            Image.asset(order.deliveryMode.imageUrl),
            Text(order.qty.toString(),
                style: TextStyle(
                    fontSize: 16,
                    color: PRIMARY_COLOR,
                    fontWeight: FontWeight.w600)),
            Text(
              NumberFormat.currency(symbol: '₦ ').format(order.total),
              style: TextStyle(
                  fontSize: 18,
                  color: PRIMARY_COLOR,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Your Cart',
          style:
              TextStyle(color: Colors.green.withOpacity(0.9), letterSpacing: 2),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left_outlined,
            size: 38,
          ),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.separated(
          itemBuilder: (context, int index) {
            final keys = user.cartItems.keys.toList();
            final OrderEntity? order = user.cartItems[keys[index]];
            return buildCartList(order);
          },
          separatorBuilder: (context, int index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child:
                    Divider(height: 1.0, color: Colors.green.withOpacity(0.9)),
              ),
          itemCount: user.cartItems.keys.toList().length),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: null,
          label: SizedBox(
            width: width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Pay',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(
                  width: width * 0.06,
                ),
                Text(
                    NumberFormat.currency(symbol: '₦ ').format(user.grandTotal),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))
              ],
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
