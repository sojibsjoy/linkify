import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/states/models/product_details.dart';
import 'package:dogventurehq/ui/designs/custom_img.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductGallery extends StatefulWidget {
  final ProductDetailsModel pModel;
  const ProductGallery({
    Key? key,
    required this.pModel,
  }) : super(key: key);

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  String _imageLink = '';
  int _selectedIndex = 0;

  @override
  void initState() {
    _imageLink = widget.pModel.productMasterMediaViewModels[0].fileLocation;
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
              InkWell(
                onTap: () => setState(() {
                  if (_selectedIndex != 0) {
                    _selectedIndex--;
                    _imageLink = widget
                        .pModel
                        .productMasterMediaViewModels[_selectedIndex]
                        .fileLocation;
                  }
                }),
                child: SvgPicture.asset(
                  'assets/svgs/arrow_left.svg',
                ),
              ),
              // image list
              SizedBox(
                width: 350.w,
                child: Center(
                  child: ListView.builder(
                    itemCount:
                        widget.pModel.productMasterMediaViewModels.length,
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => setState(() {
                          _selectedIndex = index;
                          _imageLink = widget.pModel
                              .productMasterMediaViewModels[index].fileLocation;
                        }),
                        child: Container(
                          width: 88.w,
                          height: 88.h,
                          margin: index ==
                                  widget.pModel.productMasterMediaViewModels
                                          .length -
                                      1
                              ? null
                              : EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ConstantColors.k2377A6,
                              width: _selectedIndex == index ? 3 : 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CustomImg(
                              imgUrl: widget
                                  .pModel
                                  .productMasterMediaViewModels[index]
                                  .fileLocation,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // right arrow
              InkWell(
                onTap: () => setState(() {
                  if (_selectedIndex !=
                      widget.pModel.productMasterMediaViewModels.length - 1) {
                    _selectedIndex++;
                    _imageLink = widget
                        .pModel
                        .productMasterMediaViewModels[_selectedIndex]
                        .fileLocation;
                  }
                }),
                child: SvgPicture.asset(
                  'assets/svgs/arrow_right.svg',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
