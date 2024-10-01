import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/module/weather/weather.dart';
import 'package:open_coffeeshop/shared/shared.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: ListView(
            children: [
              const StatusSection(),
              Row(
                children: [
                  Expanded(
                    child: SearchInput(
                      controller: searchController,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          context.read<SearchProductBloc>().add(
                                SearchProductEvent.searchProduct(value),
                              );
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: BlocBuilder<CartProductBloc, CartProductState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return const Icon(Icons.shopping_cart_outlined);
                          },
                          success: (data) {
                            return GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.cartPage,
                              ),
                              child: badges.Badge(
                                position:
                                    badges.BadgePosition.bottomEnd(end: 0),
                                badgeContent: Text(
                                  data.totalCart().toString(),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                badgeStyle: const badges.BadgeStyle(
                                  padding: EdgeInsets.all(4),
                                ),
                                child: const Icon(Icons.shopping_cart_outlined),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
              AppSpacing.v16(),
              if (searchController.text.isEmpty)
                const ProductListSection()
              else
                const ProductSearchSection(),
            ],
          ),
        ),
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
