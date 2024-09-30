import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_coffeeshop/module/product/product.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';
part 'get_products_bloc.freezed.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final GetProductUsecase getProductUsecase;
  GetProductsBloc(this.getProductUsecase) : super(const _Initial()) {
    on<_GetProducts>((event, emit) async {
      emit(const _Loading());

      final result = await getProductUsecase(null);

      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Success(r.data)),
      );
    });
  }
}
