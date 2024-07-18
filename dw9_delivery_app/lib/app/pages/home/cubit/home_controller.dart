import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw9_delivery_app/app/app.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(this._productsRepository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productsRepository.findAllProducts();
      emit(state.copyWith(products: products, status: HomeStateStatus.loaded));
    } catch (e, s) {
      log('Erro ao burcar productos', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStateStatus.error, errorMessage: 'Erro ao buscar os produtos'));
    }
  }

  void addOrUpdateBag(OrderProductDTO orderProduct) {
    final shoppingBag = [...state.shoppingBag];

    final orderIndex = shoppingBag.indexWhere((orderP) => orderP.product == orderProduct.product);

    if (orderIndex > -1) {
      if (orderProduct.amount == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProduct;
      }
    } else {
      shoppingBag.add(orderProduct);
    }

    emit(state.copyWith(shoppingBag: shoppingBag));
  }
}
