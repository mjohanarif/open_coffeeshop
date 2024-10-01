import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class ProductSearchSection extends StatelessWidget {
  const ProductSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductBloc, SearchProductState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const SizedBox();
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (data) {
            if (data.isNotEmpty) {
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
            }
            return Padding(
              padding: EdgeInsets.only(top: 100.h),
              child: const Center(
                child: Text('No Data Found'),
              ),
            );
          },
        );
      },
    );
  }
}
