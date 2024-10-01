import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class ProductListSection extends StatelessWidget {
  const ProductListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsBloc, GetProductsState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const SizedBox();
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (data) {
            return ListView.separated(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 16),
              itemBuilder: (context, index) {
                return ProductCard(data: data[index]);
              },
              separatorBuilder: (context, index) => AppSpacing.v16(),
              itemCount: data.length,
            );
          },
        );
      },
    );
  }
}
