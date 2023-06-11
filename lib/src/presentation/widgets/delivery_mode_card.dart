import 'package:flutter/material.dart';

class DeliveryModeCard extends StatelessWidget {
  const DeliveryModeCard({
    super.key,
    required this.width,
    required this.height,
    required this.imageUrl,
    required this.deliveryMode,
    required this.color,
    this.fontWeight = FontWeight.bold,
    this.fontColor = Colors.black,
  });

  final double width;
  final double height;
  final String imageUrl;
  final String? deliveryMode;
  final Color color;
  final FontWeight fontWeight;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height), color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imageUrl),
          Text(
            deliveryMode!,
            style: TextStyle(fontWeight: fontWeight, color: fontColor),
          )
        ],
      ),
    );
  }
}
