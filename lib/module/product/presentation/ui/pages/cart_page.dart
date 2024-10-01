import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
      ),
      body: BlocConsumer<CartProductBloc, CartProductState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            initial: () => Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.main,
              (Route<dynamic> route) => false,
            ),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const SizedBox();
            },
            success: (data) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  ...data.cartList
                      .map((product) => OrderCard(product: product)),
                  AppSpacing.v8(),
                  Row(
                    children: [
                      const SizedBox(
                        width: 120,
                        child: Text('Total Products'),
                      ),
                      const Text(':\t'),
                      Text(
                        '${data.totalCart()}',
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  AppSpacing.v8(),
                  Row(
                    children: [
                      const SizedBox(
                        width: 120,
                        child: Text('Total Price'),
                      ),
                      const Text(':\t'),
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
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 52,
        margin: const EdgeInsets.all(16),
        child: PrimaryButton(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.paymentPage);
          },
          title: 'Pay Now',
        ),
      ),
    );
  }
}
