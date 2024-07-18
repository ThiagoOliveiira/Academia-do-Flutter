import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    controller.loadProducts();
    super.onReady();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          if (state.status == HomeStateStatus.loading) {
            return showLoader();
          } else if (state.status == HomeStateStatus.error) {
            return showError(state.errorMessage ?? 'Erro não informado');
          } else {
            return hideLoader();
          }
        },
        buildWhen: (previous, current) => current.status == HomeStateStatus.initial || current.status == HomeStateStatus.loaded ? true : false,
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    final orders = state.shoppingBag.where((order) => order.product == product);
                    return DeliveryProductTile(
                      product: product,
                      orderProduct: orders.isNotEmpty ? orders.first : null,
                    );
                  },
                ),
              ),
              Visibility(
                visible: state.shoppingBag.isNotEmpty,
                child: ShoppingBagWidget(bag: state.shoppingBag),
              ),
            ],
          );
        },
      ),
    );
  }
}
