import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class ProductCard extends StatelessWidget {
  final ProductModel data;
  const ProductCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.detailProductPage,
          arguments: data,
        );
      },
      child: Container(
        height: 100.h,
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          boxShadow: AppColors.primaryShadow,
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCachedImage(
              urlToImage: data.imageUrl,
              width: 100.w,
              height: 100.h,
            ),
            AppSpacing.h16(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    data.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      data.price.toString().currencyFormatRp,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.h16(),
          ],
        ),
      ),
    );
  }
}
