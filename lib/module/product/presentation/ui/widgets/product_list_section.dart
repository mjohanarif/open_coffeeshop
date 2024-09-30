import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class ProductListSection extends StatelessWidget {
  const ProductListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsBloc, GetProductsState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const SizedBox();
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (data) {
            return ListView.separated(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 16),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
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
                          urlToImage: data[index].imageUrl,
                          width: 100.w,
                          height: 100.h,
                        ),
                        AppSpacing.h16(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                data[index].description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  data[index].price.toString().currencyFormatRp,
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
              },
              separatorBuilder: (context, index) => AppSpacing.v16(),
              itemCount: data.length,
            );
          },
        );
      },
    );
  }
}
