// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_controller.dart';

enum HomeStateStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDTO> shoppingBag;

  const HomeState({required this.shoppingBag, required this.status, required this.products, this.errorMessage});

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        errorMessage = null,
        products = const [],
        shoppingBag = const [];

  @override
  List get props => [status, products, errorMessage, shoppingBag];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
    List<OrderProductDTO>? shoppingBag,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      shoppingBag: shoppingBag ?? this.shoppingBag,
    );
  }
}
