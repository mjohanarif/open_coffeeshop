import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class DetailProductPage extends StatelessWidget {
  final ProductModel data;

  const DetailProductPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        centerTitle: true,
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          CustomCachedImage(urlToImage: data.imageUrl),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                AppSpacing.v16(),
                Text(
                  data.description,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              onTap: () {
                context.read<CartProductBloc>().add(
                      CartProductEvent.addProduct(data),
                    );
              },
              title: 'Add to chart',
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<CartProductBloc, CartProductState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const SizedBox();
            },
            success: (data) {
              return CartSection(data: data);
            },
          );
        },
      ),
    );
  }
}
