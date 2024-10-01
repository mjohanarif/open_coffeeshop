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
  Future<CartOrderModel> addProductCart((ProductModel, CartOrderModel) params);
  Future<CartOrderModel> subtractProductCart(
      (ProductModel, CartOrderModel) params);
  Future<CartOrderModel> deleteProductCart(
      (ProductModel, CartOrderModel) params);
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

  @override
  Future<CartOrderModel> addProductCart(
      (ProductModel, CartOrderModel) params) async {
    int isExist = params.$2.cartList
        .indexWhere((element) => element.products == params.$1);
    if (isExist == -1) {
      params.$2.cartList.add(
        CartProductModel(total: 1, products: params.$1),
      );
    } else {
      params.$2.cartList[isExist] = params.$2.cartList[isExist]
          .copyWith(total: params.$2.cartList[isExist].total + 1);
    }
    return params.$2;
  }

  @override
  Future<CartOrderModel> subtractProductCart(
      (ProductModel, CartOrderModel) params) async {
    int isExist = params.$2.cartList
        .indexWhere((element) => element.products == params.$1);
    if (isExist != -1) {
      params.$2.cartList[isExist] = params.$2.cartList[isExist]
          .copyWith(total: params.$2.cartList[isExist].total - 1);
    }

    return params.$2;
  }

  @override
  Future<CartOrderModel> deleteProductCart(
      (ProductModel, CartOrderModel) params) async {
    int isExist = params.$2.cartList
        .indexWhere((element) => element.products == params.$1);
    if (isExist != -1) {
      params.$2.cartList.removeAt(isExist);
    }
    return params.$2;
  }
}
