import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/states/models/products.dart';
import 'package:dogventurehq/ui/designs/custom_img.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductGallery extends StatefulWidget {
  final ProductModel pModel;
  const ProductGallery({
    Key? key,
    required this.pModel,
  }) : super(key: key);

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  String _imageLink = '';

  @override
  void initState() {
    _imageLink = widget.pModel.productSubSkuRequestModels[0].largeImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // product image
        CustomImg(
          imgUrl: _imageLink,
          imgWidth: 250.w,
          imgHeight: 255.h,
        ),
        addH(10.h),
        // gallery
        Container(
          width: double.infinity,
          height: 90.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // left arrow
              SvgPicture.asset(
                'assets/svgs/arrow_left.svg',
              ),
              // image list
              SizedBox(
                width: 350.w,
                child: Center(
                  child: ListView.builder(
                    itemCount: widget.pModel.productSubSkuRequestModels.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => setState(
                          () => _imageLink = widget.pModel
                              .productSubSkuRequestModels[index].largeImage,
                        ),
                        child: Container(
                          width: 88.w,
                          height: 88.h,
                          margin: index ==
                                  widget.pModel.productSubSkuRequestModels
                                          .length -
                                      1
                              ? null
                              : EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ConstantColors.k2377A6,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CustomImg(
                              imgUrl: widget.pModel
                                  .productSubSkuRequestModels[index].largeImage,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // right arrow
              SvgPicture.asset(
                'assets/svgs/arrow_right.svg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
