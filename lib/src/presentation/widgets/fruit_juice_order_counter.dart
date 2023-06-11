import 'package:flutter/material.dart';

class FruitJuiceOrderCounter extends StatefulWidget {
  const FruitJuiceOrderCounter({
    super.key,
    required this.height,
    required this.width,
    required this.qtyController,
    required this.onChanged,
  });

  final double height;
  final double width;
  final TextEditingController qtyController;
  final Function(String)? onChanged;

  @override
  State<FruitJuiceOrderCounter> createState() => _FruitJuiceOrderCounterState();
}

class _FruitJuiceOrderCounterState extends State<FruitJuiceOrderCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.height * 0.2),
            color: Colors.grey.shade300),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            controller: widget.qtyController,
            onChanged: widget.onChanged,
            validator: (value) {
              if (value!.isEmpty) {
                return 'add qty';
              } else if (int.parse(value).isNaN) {
                return 'Wrong Type';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              disabledBorder: InputBorder.none,
              border: InputBorder.none,
            ),
          ),
        ));
  }
}
