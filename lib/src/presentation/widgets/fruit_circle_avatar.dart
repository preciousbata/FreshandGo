import 'package:flutter/material.dart';
import 'package:restaurant_app/src/core/contants.dart';

class FruitCircleAvatar extends StatelessWidget {
  const FruitCircleAvatar({
    super.key,
    required this.width,
    required this.imageUrl,
  });

  final double width;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: width,
      backgroundImage: NetworkImage('$GOOGLE_DRIVE_PREFIX$imageUrl'),
    );
  }
}
