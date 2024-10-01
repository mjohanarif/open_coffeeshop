import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_coffeeshop/module/product/product.dart';

part 'cart_product_event.dart';
part 'cart_product_state.dart';
part 'cart_product_bloc.freezed.dart';

class CartProductBloc extends Bloc<CartProductEvent, CartProductState> {
  final AddProductCartUsecase addProductCartUsecase;
  final SubtractProductCartUsecase subtractProductCartUsecase;
  final DeleteProductCartUsecase deleteProductCartUsecase;

  CartProductBloc(
    this.addProductCartUsecase,
    this.subtractProductCartUsecase,
    this.deleteProductCartUsecase,
  ) : super(const _Initial()) {
    // ignore: prefer_const_constructors
    CartOrderModel listCart = CartOrderModel(cartList: []);

    on<_Started>((event, emit) async {
      listCart.cartList.clear();
      emit(const _Initial());
    });

    on<_AddProduct>((event, emit) async {
      emit(const _Loading());

      final result = await addProductCartUsecase(
        (event.product, listCart),
      );

      result.fold(
        (l) => const _Initial(),
        (r) => emit(_Success(r)),
      );
    });

    on<_SubtractProduct>((event, emit) async {
      emit(const _Loading());

      final result = await subtractProductCartUsecase(
        (event.product, listCart),
      );

      result.fold(
        (l) => const _Initial(),
        (r) {
          if (r.cartList.isEmpty) {
            emit(const _Initial());
          } else {
            emit(_Success(r));
          }
        },
      );
    });

    on<_DeleteProduct>((event, emit) async {
      emit(const _Loading());

      final result = await deleteProductCartUsecase(
        (event.product, listCart),
      );

      result.fold(
        (l) => const _Initial(),
        (r) {
          if (r.cartList.isEmpty) {
            emit(const _Initial());
          } else {
            emit(_Success(r));
          }
        },
      );
    });
  }
}
