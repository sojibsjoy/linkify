import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/states/models/products.dart';
import 'package:dogventurehq/ui/designs/custom_img.dart';
import 'package:dogventurehq/ui/screens/home/build_text.dart';
import 'package:dogventurehq/ui/screens/product_details/product_details.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatefulWidget {
  final ProductModel pModel;
  double? cardWidth;
  double? imgHeight;
  double? imgWidth;
  ProductCard({
    Key? key,
    required this.pModel,
    this.cardWidth,
    this.imgWidth,
    this.imgHeight,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.cardWidth ?? 160.w,
      height: widget.imgHeight ?? 220.h,
      child: Center(
        child: Stack(
          children: [
            // Product Image, Name, Price
            InkWell(
              onTap: () => Get.toNamed(
                ProductDetails.routeName,
                arguments: widget.pModel,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ConstantColors.kD4EAFC,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImg(
                      imgUrl: widget
                          .pModel.productSubSkuRequestModels[0].largeImage,
                      imgWidth: widget.imgWidth ?? 154.w,
                      imgHeight: widget.imgHeight ?? 154.h,
                      imgFit: BoxFit.fill,
                    ),
                    addH(10.h),
                    Container(
                      width: widget.imgWidth,
                      height: 36.w,
                      padding: EdgeInsets.only(left: 5.w),
                      child: BuildText(
                        text: widget.pModel.productName,
                        maximumLines: 2,
                      ),
                    ),
                    addH(5.h),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: BuildText(
                        text:
                            'AED ${widget.pModel.productSubSkuRequestModels[0].price}',
                        txtClr: ConstantColors.k2377A6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Favorite Icon
            Positioned(
              bottom: 10.h,
              right: 10.w,
              child: InkWell(
                onTap: () => setState(() => isFavorite = !isFavorite),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: ConstantColors.k2377A6,
                  size: 20.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
