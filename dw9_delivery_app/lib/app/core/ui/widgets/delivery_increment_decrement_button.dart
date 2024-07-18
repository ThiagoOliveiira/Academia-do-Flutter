import 'package:dw9_delivery_app/app/app.dart';
import 'package:flutter/material.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  final int amount;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;

  const DeliveryIncrementDecrementButton({super.key, required this.amount, required this.incrementTap, required this.decrementTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(onTap: decrementTap, child: const Icon(Icons.remove)),
          Text(
            amount.toString(),
            style: context.textStyles.textRegular.copyWith(
              fontSize: 17,
              color: context.colors.secondary,
            ),
          ),
          InkWell(onTap: incrementTap, child: Icon(Icons.add, color: context.colors.secondary)),
        ],
      ),
    );
  }
}
