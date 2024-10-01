import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {
  final CartProductModel product;
  const OrderCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(6),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCachedImage(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(8),
                  ),
                  urlToImage: product.products.imageUrl,
                  width: 50.w,
                  height: 50.h,
                ),
                const AppSpacing(h: 6),
                Expanded(
                  child: Text(
                    product.products.name,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const AppSpacing(h: 6),
                Text('x ${product.total} = '),
                Text(
                  '${product.total * product.products.price}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const AppSpacing(h: 8),
        GestureDetector(
          onTap: () {
            context.read<CartProductBloc>().add(
                  CartProductEvent.deleteProduct(product.products),
                );
          },
          child: const Icon(
            Icons.delete_forever_outlined,
            color: AppColors.red,
          ),
        )
      ],
    );
  }
}
