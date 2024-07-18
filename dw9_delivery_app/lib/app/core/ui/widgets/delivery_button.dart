import 'package:flutter/material.dart';

import '../../../app.dart';

class DeliveryButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final double? width;
  final double? height;

  const DeliveryButton({super.key, required this.label, required this.onPressed, this.height = 50, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label, style: TextStyles.i.textBold.copyWith(fontSize: 14)),
      ),
    );
  }
}
