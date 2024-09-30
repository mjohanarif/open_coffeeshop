import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

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
              SearchInput(
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
              AppSpacing.v16(),
              if (searchController.text.isEmpty)
                const ProductListSection()
              else
                const ProductSearchSection(),
            ],
          ),
        ),
      ),
    );
  }
}
