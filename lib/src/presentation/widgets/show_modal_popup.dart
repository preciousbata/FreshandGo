import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/src/core/contants.dart';
import 'package:restaurant_app/src/domain/entity/cup_size_entity.dart';
import 'package:restaurant_app/src/domain/entity/delivery_mode_entity.dart';
import 'package:restaurant_app/src/domain/entity/order_entity.dart';
import 'package:restaurant_app/src/domain/entity/user_entity.dart';
import 'package:restaurant_app/src/presentation/widgets/custom_button.dart';
import 'package:restaurant_app/src/presentation/widgets/delivery_mode_card.dart';
import 'package:restaurant_app/src/presentation/widgets/drink_size_card.dart';
import 'package:restaurant_app/src/presentation/widgets/fruit_circle_avatar.dart';
import 'package:restaurant_app/src/presentation/widgets/fruit_juice_order_counter.dart';

class ShowModalPopUp extends StatefulWidget {
  const ShowModalPopUp({
    super.key,
    required this.width,
    required this.height,
    required this.imageUrl,
    required this.amount,
    required this.juiceName,
  });

  final double width;
  final double height;
  final String imageUrl;
  final int amount;
  final String juiceName;

  @override
  State<ShowModalPopUp> createState() => _ShowModalPopUpState();
}

class _ShowModalPopUpState extends State<ShowModalPopUp>
    with SingleTickerProviderStateMixin {
  int cupSizeCurrentIndex = 0;
  int deliveryModecurrentIndex = 0;
  TextEditingController qty = TextEditingController();
  late final AnimationController _controller;
  bool addedToCart = false;

  void _printLatestValue() {
    null;
  }

  @override
  void initState() {
    qty.text = '1';
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    qty.addListener(_printLatestValue);
    super.initState();
  }

  int get priceTotal {
    if (qty.text.toString().isEmpty) {
      return 0;
    }
    return int.parse(qty.text.toString()) *
        (widget.amount +
            int.parse(cupSizeList[cupSizeCurrentIndex].price.toString()) +
            int.parse(
                deliveryModeList[deliveryModecurrentIndex].price.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return addedToCart
        ? Column(
            children: [
              Lottie.asset('assets/59945-success-confetti.json'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${widget.juiceName} Juice was successfully added to your cart.',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        : ListView(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FruitCircleAvatar(
                      width: widget.width * 0.4, imageUrl: widget.imageUrl),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.juiceName.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: PRIMARY_COLOR,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        NumberFormat.currency(symbol: '₦ ').format(priceTotal),
                        style: TextStyle(
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                            color: PRIMARY_COLOR,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: widget.height * 0.22,
                ),
                FruitJuiceOrderCounter(
                  height: widget.height,
                  width: widget.width * 1,
                  qtyController: qty,
                  onChanged: (value) {
                    setState(() {
                      qty.text;
                    });
                  },
                ),
                SizedBox(
                  height: widget.height * 0.34,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(
                          cupSizeList.length,
                          (index) => GestureDetector(
                              onTap: () => setState(() {
                                    cupSizeCurrentIndex = index;
                                  }),
                              child: DrinkSizeCard(
                                  width: widget.width * 0.7,
                                  height: widget.height * 2,
                                  fontWeight: cupSizeCurrentIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.w400,
                                  fontColor: cupSizeCurrentIndex == index
                                      ? Colors.black
                                      : WHITE,
                                  color: cupSizeCurrentIndex == index
                                      ? Colors.green.withOpacity(0.6)
                                      : Colors.grey.shade400,
                                  imageUrl: cupSizeList[index].imageUrl,
                                  size: cupSizeList[index].size)))
                    ],
                  ),
                ),
                SizedBox(
                  height: widget.height * 0.24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                        deliveryModeList.length,
                        (index) => GestureDetector(
                              onTap: () => setState(() {
                                deliveryModecurrentIndex = index;
                              }),
                              child: DeliveryModeCard(
                                  width: widget.width * 1.6,
                                  height: widget.height * 2,
                                  fontWeight: deliveryModecurrentIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.w400,
                                  fontColor: deliveryModecurrentIndex == index
                                      ? Colors.black
                                      : WHITE,
                                  color: deliveryModecurrentIndex == index
                                      ? Colors.green.withOpacity(0.6)
                                      : Colors.grey.shade400,
                                  imageUrl: deliveryModeList[index].imageUrl,
                                  deliveryMode:
                                      deliveryModeList[index].deliveryMode),
                            ))
                  ],
                ),
                SizedBox(
                  height: widget.height * 0.32,
                ),
                GestureDetector(
                  onTap: () {
                    if (addedToCart == false) {
                      addedToCart = true;
                      currentUser.addToCart(
                        widget.juiceName,
                        OrderEntity(
                          deliveryMode:
                              deliveryModeList[deliveryModecurrentIndex],
                          cupSize: cupSizeList[cupSizeCurrentIndex],
                          juiceName: widget.juiceName,
                          total: priceTotal,
                          imageUrl: widget.imageUrl,
                          qty: int.parse(
                            qty.text.toString(),
                          ),
                        ),
                      );

                      setState(() {
                        _controller
                            .forward()
                            .whenComplete(() => Navigator.pop(context));
                      });
                    }
                  },
                  child: CustomButton(
                    height: widget.height,
                    width: widget.width,
                    size: widget.width * 0.3,
                    icon: Icons.shopping_bag_outlined,
                    text: 'Add To Cart',
                  ),
                ),
              ],
            )
          ]);
  }
}
