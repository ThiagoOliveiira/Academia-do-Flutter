import 'package:dw9_delivery_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;
  final OrderProductDTO? orderProduct;
  const DeliveryProductTile({super.key, required this.product, required this.orderProduct});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = context.read<HomeController>();
        final orderProductResult = await Navigator.of(context).pushNamed('/productDetail', arguments: {'product': product, 'order': orderProduct});

        if (orderProductResult != null) controller.addOrUpdateBag(orderProductResult as OrderProductDTO);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: const EdgeInsets.only(bottom: 8), child: Text(product.name, style: context.textStyles.textExtraBold.copyWith(fontSize: 16))),
                  Padding(padding: const EdgeInsets.only(bottom: 8), child: Text(product.description, style: context.textStyles.textRegular.copyWith(fontSize: 12))),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8), child: Text(product.price.currentPTBR, style: context.textStyles.textMedium.copyWith(fontSize: 12, color: context.colors.secondary))),
                ],
              ),
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: product.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
