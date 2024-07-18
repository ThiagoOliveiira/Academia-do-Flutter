import 'package:auto_size_text/auto_size_text.dart';
import 'package:dw9_delivery_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  final OrderProductDTO? order;

  const ProductDetailPage({super.key, required this.product, this.order});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  void initState() {
    super.initState();

    final amount = widget.order?.amount ?? 1;
    controller.initial(amount, widget.order != null);
  }

  void _showConfirmDelete(int amount) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Deseja excluir o produto?'),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancelar', style: context.textStyles.textBold.copyWith(color: Colors.red))),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).pop(OrderProductDTO(product: widget.product, amount: amount));
                },
                child: Text('Confirmar', style: context.textStyles.textBold.copyWith(color: context.colors.primary))),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(widget.product.name, style: context.textStyles.textExtraBold.copyWith(fontSize: 22)),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(child: Text(widget.product.description, style: context.textStyles.textRegular)),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Container(
                  height: 68,
                  padding: const EdgeInsets.all(8),
                  width: context.percentWidth(.5),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                      return DeliveryIncrementDecrementButton(
                        incrementTap: controller.increment,
                        decrementTap: controller.decrement,
                        amount: amount,
                      );
                    },
                  )),
              Container(
                width: context.percentWidth(.5),
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<ProductDetailController, int>(
                  builder: (context, amount) {
                    return ElevatedButton(
                        style: amount == 0 ? ElevatedButton.styleFrom(backgroundColor: Colors.red) : null,
                        onPressed: () {
                          if (amount == 0) {
                            _showConfirmDelete(amount);
                          } else {
                            Navigator.of(context).pop(OrderProductDTO(product: widget.product, amount: amount));
                          }
                        },
                        child: Visibility(
                          visible: amount > 0,
                          replacement: Text('Excluir Produto', style: context.textStyles.textExtraBold.copyWith(color: Colors.white)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Adicionar', style: context.textStyles.textButtonLabel),
                              const SizedBox(width: 10),
                              Expanded(
                                child: AutoSizeText(
                                  (widget.product.price * amount).currentPTBR,
                                  minFontSize: 5,
                                  maxFontSize: 13,
                                  maxLines: 1,
                                  style: context.textStyles.textExtraBold.copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
