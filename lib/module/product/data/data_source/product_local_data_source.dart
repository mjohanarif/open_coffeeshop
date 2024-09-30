import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

abstract class ProductLocalDataSource {
  Future<ProductsReponse> getDataProducts();
  Future<ProductsReponse> getlocalProducts();
  Future<ProductsReponse> searchProducts(String query);
  Future<String> saveProducts(ProductsReponse productList);
  Future<bool> isDataSavedLocally();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final CacheHandler cacheHandler;

  ProductLocalDataSourceImpl({required this.cacheHandler});

  @override
  Future<ProductsReponse> getDataProducts() async {
    try {
      final String response =
          await rootBundle.loadString('assets/products.json');
      return ProductsReponse.fromJson(json.decode(response));
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<ProductsReponse> getlocalProducts() async {
    try {
      final result = await cacheHandler.getCache(
        boxKey: Constant.productKey,
      );

      if (result == null) {
        throw CacheException(message: "Can't get Products data");
      }

      return ProductsReponse.fromJson(jsonDecode(result));
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }

  @override
  Future<String> saveProducts(ProductsReponse productList) async {
    try {
      final result = await cacheHandler.setCache(
        boxKey: Constant.productKey,
        value: jsonEncode(productList.toJson()),
      );

      if (result == null) {
        throw CacheException(message: "Can't save products data");
      }
      isDataSavedLocally();

      return 'Success saving products';
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }

  @override
  Future<ProductsReponse> searchProducts(String query) async {
    try {
      final result = await cacheHandler.getCache(
        boxKey: Constant.productKey,
      );

      if (result == null) {
        throw CacheException(message: "Can't get search product data");
      } else if (query.isEmpty) {
        return const ProductsReponse(
          status: 'success',
          data: [],
        );
      }

      var temp = ProductsReponse.fromJson(jsonDecode(result))
          .data
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      return ProductsReponse(
        status: 'success',
        data: temp,
      );
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }

  @override
  Future<bool> isDataSavedLocally() async {
    return await cacheHandler.cache.boxExists(Constant.productKey);
  }
}
