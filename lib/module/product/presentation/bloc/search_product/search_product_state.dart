part of 'search_product_bloc.dart';

@freezed
class SearchProductState with _$SearchProductState {
  const factory SearchProductState.initial() = _Initial;
  const factory SearchProductState.loading() = _Loading;
  const factory SearchProductState.success(List<ProductModel> data) = _Success;
  const factory SearchProductState.error(String message) = _Error;
}
