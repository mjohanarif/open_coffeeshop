import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class CartSection extends StatelessWidget {
  final CartOrderModel data;
  const CartSection({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.cartPage,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: AppColors.primaryShadow,
          color: const Color(0xffB3E5FC),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...data.cartList.map((product) => Row(
                  children: [
                    Expanded(
                        child: Text(
                            '${product.products.name} : ${product.total}')),
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
                )),
            AppSpacing.v8(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Total Product : ',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${data.totalCart()}',
                          style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Total Price : ',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          data.totalPriceCart().toString().currencyFormatRp,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                AppSpacing.h16(),
                Expanded(
                  child: PrimaryButton(
                    title: 'Pay Now',
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.paymentPage);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
