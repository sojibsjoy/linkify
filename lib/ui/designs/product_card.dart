import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/screens/home/build_text.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final VoidCallback onTapFn;
  final String imgUrl;
  final String productName;
  final double price;
  double? cardWidth;
  double? imgWidth;
  ProductCard({
    Key? key,
    required this.onTapFn,
    required this.imgUrl,
    required this.productName,
    required this.price,
    this.cardWidth,
    this.imgWidth,
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
      height: 220.h,
      child: Center(
        child: Stack(
          children: [
            // Product Image, Name, Price
            Container(
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
                  Image.asset(
                    widget.imgUrl,
                    width: widget.imgWidth ?? 154.w,
                    height: 154.h,
                    fit: BoxFit.fill,
                  ),
                  addH(10.h),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: BuildText(
                      text: widget.productName,
                    ),
                  ),
                  addH(5.h),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: BuildText(
                      text: 'AED ${widget.price}',
                      txtClr: ConstantColors.k2377A6,
                    ),
                  ),
                ],
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
