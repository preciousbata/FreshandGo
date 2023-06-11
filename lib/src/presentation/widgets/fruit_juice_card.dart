import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_app/src/core/contants.dart';

class FruitJuiceCard extends StatelessWidget {
  const FruitJuiceCard({
    super.key,
    required this.width,
    required this.imageUrl,
    required this.amount,
    required this.juiceName,
  });

  final double width;
  final String imageUrl;
  final int amount;
  final String juiceName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image.network(
            '$GOOGLE_DRIVE_PREFIX$imageUrl',
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 15,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  juiceName,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Text(
                  NumberFormat.currency(symbol: '₦ ').format(amount),
                  style: const TextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
