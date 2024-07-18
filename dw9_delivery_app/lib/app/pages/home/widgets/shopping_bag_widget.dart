import 'package:dw9_delivery_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDTO> bag;
  const ShoppingBagWidget({super.key, required this.bag});

  Future<void> _goOrder(BuildContext context) async {
    final navigator = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();
    if (!sp.containsKey('accessToken')) {
      // envio para login

      final loginResult = await navigator.pushNamed('/auth/login');
    }

    //envio para o order
  }

  @override
  Widget build(BuildContext context) {
    var totalBag = bag.fold<double>(0.0, (total, element) => total += element.totalPrice).currentPTBR;
    return Container(
      padding: const EdgeInsets.all(10),
      width: context.screenWidth,
      height: context.percentWidth(.16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: ElevatedButton(
        onPressed: () {
          _goOrder(context);
        },
        child: Stack(
          children: [
            const Align(alignment: Alignment.centerLeft, child: Icon(Icons.shopping_cart_outlined, color: Colors.white)),
            Align(alignment: Alignment.center, child: Text('Ver Sacola', style: context.textStyles.textExtraBold.copyWith(color: Colors.white))),
            Align(alignment: Alignment.centerRight, child: Text(totalBag, style: context.textStyles.textExtraBold.copyWith(color: Colors.white, fontSize: 11))),
          ],
        ),
      ),
    );
  }
}
