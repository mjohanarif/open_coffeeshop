import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_coffeeshop/module/product/product.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';
part 'search_product_bloc.freezed.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  final SearchProductUsecase searchProductUsecase;

  SearchProductBloc(this.searchProductUsecase) : super(const _Initial()) {
    on<SearchProductEvent>((event, emit) {
      event.map(searchProduct: (event) async {
        emit(const _Loading());

        final result = await searchProductUsecase(event.params);

        result.fold(
          (l) => emit(_Error(l.message)),
          (r) => emit(_Success(r.data)),
        );
      });
    });
  }
}
