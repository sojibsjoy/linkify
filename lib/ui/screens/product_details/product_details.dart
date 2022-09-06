import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/products.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/cart_item.dart';
import 'package:dogventurehq/states/models/products.dart';
import 'package:dogventurehq/states/models/user.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_title.dart';
import 'package:dogventurehq/ui/designs/quantity_edit.dart';
import 'package:dogventurehq/ui/screens/cart/cart.dart';
import 'package:dogventurehq/ui/screens/product_details/product_gallery.dart';
import 'package:dogventurehq/ui/screens/product_details/rating_item.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:dogventurehq/ui/widgets/horizontal_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class ProductDetails extends StatefulWidget {
  static String routeName = '/product_details';
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductsController _productsCon = Get.find<ProductsController>();
  late ProductModel pModel;
  late UserModel uModel;
  int _quantity = 1;
  int _selectedPackageIndex = 0;

  bool _isFavorite = false;
  bool _isAddingtoCart = false;

  @override
  void initState() {
    uModel = Preference.getUserDetails();
    pModel = Get.arguments;
    _productsCon.getProductDetails(
      productMasterID: pModel.productMasterId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Obx(
        () {
          if (_productsCon.productDetailsLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (_productsCon.pDetailsModel == null) {
              return Center(
                child: Text(ConstantStrings.kWentWrong),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 725.h,
                      child: Stack(
                        children: [
                          // bg
                          Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 485.h,
                              ),
                              Container(
                                width: double.infinity,
                                height: 240.h,
                                color: ConstantColors.kD4EAFC,
                              )
                            ],
                          ),
                          // products name, image, cart icon, favorite icon, gallery, price
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: CustomTitle(
                                  title: '',
                                  // cart icon
                                  suffixIcon: 'assets/svgs/cart.svg',
                                  suffixOnTapFn: () => Get.toNamed(
                                    CartScreen.routeName,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // product name
                                    SizedBox(
                                      width: 355.w,
                                      height: 45.h,
                                      child: AutoSizeText(
                                        _productsCon.pDetailsModel!.productName,
                                        maxLines: 2,
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily:
                                              ConstantStrings.kFontFamily,
                                        ),
                                      ),
                                    ),
                                    // favorite icon
                                    InkWell(
                                      onTap: () => setState(
                                        () => _isFavorite = !_isFavorite,
                                      ),
                                      child: Icon(
                                        _isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        color: _isFavorite ? Colors.red : null,
                                        size: 29,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // product image & gallery
                              ProductGallery(
                                  pModel: _productsCon.pDetailsModel!),
                              addH(30.h),
                              // prices
                              Row(
                                children: [
                                  addW(20.w),
                                  Text(
                                    "AED${_productsCon.pDetailsModel!.productSubSkuRequestModels[0].price}",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: ConstantStrings.kFontFamily,
                                    ),
                                  ),
                                  addW(10.w),
                                  Text(
                                    "AED${_productsCon.pDetailsModel!.productSubSkuRequestModels[0].price}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.sp,
                                      decoration: TextDecoration.lineThrough,
                                      fontFamily: ConstantStrings.kFontFamily,
                                    ),
                                  ),
                                ],
                              ),
                              addH(20.h),
                              // packages
                              SizedBox(
                                width: double.infinity,
                                height: 65.h,
                                child: Center(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _productsCon.pDetailsModel!
                                        .productSubSkuRequestModels.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Center(
                                        child: InkWell(
                                          onTap: () => setState(() =>
                                              _selectedPackageIndex = index),
                                          child: Container(
                                            width: 125.w,
                                            height: 65.h,
                                            margin: index ==
                                                    _productsCon
                                                            .pDetailsModel!
                                                            .productSubSkuRequestModels
                                                            .length -
                                                        1
                                                ? null
                                                : EdgeInsets.only(right: 10.w),
                                            decoration: BoxDecoration(
                                              color:
                                                  _selectedPackageIndex == index
                                                      ? ConstantColors.k87C1DF
                                                      : ConstantColors.kF7F8FC,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: ConstantColors.k2377A6,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "AED${_productsCon.pDetailsModel!.productSubSkuRequestModels[index].price}",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: ConstantStrings
                                                        .kFontFamily,
                                                  ),
                                                ),
                                                addH(5.h),
                                                SizedBox(
                                                  height: 30.h,
                                                  width: 125.w,
                                                  // color: Colors.amber,
                                                  child: AutoSizeText(
                                                    _productsCon
                                                        .pDetailsModel!
                                                        .productSubSkuRequestModels[
                                                            index]
                                                        .subSku,
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    minFontSize: 8,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              addH(20.h),
                              // minimum order text
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Minimum Order: 100 Pieces',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey.shade700,
                                        fontFamily: ConstantStrings.kFontFamily,
                                      ),
                                    ),
                                    Text(
                                      'AED 10.00 Per Unit',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: ConstantStrings.kFontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    addH(20.h),
                    // description, spacification, ratings, & related products
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitle('Description'),
                          addH(10.h),
                          SizedBox(
                            height: 465.h,
                            child: SingleChildScrollView(
                              primary: false,
                              child: HtmlWidget(
                                ConstantStrings.kHtmlPrefix +
                                    _productsCon.pDetailsModel!.description +
                                    ConstantStrings.kHtmlPostFix,
                                isSelectable: true,
                                onLoadingBuilder: (
                                  context,
                                  element,
                                  loadingProgress,
                                ) =>
                                    const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            // child: ListView.builder(
                            //   itemCount: 5,
                            //   itemBuilder: (BuildContext context, int index) {
                            //     return const DescriptionItem();
                            //   },
                            // ),
                          ),
                          addH(20.h),
                          // Specification
                          _buildTitle('Specification'),
                          addH(10.h),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Brand, Display Resolution, Material Type',
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          addH(20.h),
                          // Delivery
                          _buildTitle('Delivery'),
                          addH(10.h),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ulaya Dist. Riyadh, Saudi Arabia',
                                      style: TextStyle(
                                        color: ConstantColors.k2377A6,
                                      ),
                                    ),
                                    const Text(
                                      'Brand, Display Resolution, Material Type',
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          addH(20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 130.w,
                                child: Row(
                                  children: [
                                    Text(
                                      'Ratings',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: ConstantStrings.kFontFamily,
                                      ),
                                    ),
                                    addW(10.w),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: ConstantColors.k2377A6,
                                    ),
                                    Text(
                                      _productsCon.pDetailsModel!.totalRating
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: ConstantStrings.kFontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      '12 Ratings',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                        fontFamily: ConstantStrings.kFontFamily,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // TODO: see all ratings
                                      },
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          addH(10.h),
                          // Ratings
                          const RatingItem(
                            name: 'Irfan A.',
                            date: '08 Jan 2022',
                            subTxt: 'Color Family: Blue',
                            dividerFlag: true,
                          ),
                          const RatingItem(
                            name: 'Irfan A.',
                            date: '08 Jan 2022',
                            subTxt: 'Color Family: Blue',
                            dividerFlag: true,
                          ),
                          const RatingItem(
                            name: 'Irfan A.',
                            date: '08 Jan 2022',
                            subTxt: 'Color Family: Blue',
                            dividerFlag: true,
                          ),
                          const RatingItem(
                            name: 'Irfan A.',
                            date: '08 Jan 2022',
                            subTxt: 'Color Family: Blue',
                            dividerFlag: false,
                          ),
                          Center(
                            child: Text(
                              'View All',
                              style: TextStyle(
                                fontSize: 14,
                                color: ConstantColors.k2377A6,
                                fontFamily: ConstantStrings.kFontFamily,
                              ),
                            ),
                          ),
                          addH(20.h),
                          // Related Products
                          HorizontalList(
                            loadingFlag: _productsCon.productsLoading,
                            productList: _productsCon.productList,
                            title: 'Related Products',
                            viewAllTxtFn: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    ), bottomNavigationBar: Obx(() {
      if (_productsCon.productDetailsLoading.value) {
        return const SizedBox.shrink();
      } else {
        if (_productsCon.pDetailsModel == null) {
          return const SizedBox.shrink();
        } else {
          return Container(
            width: 428.w,
            height: 75.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                QuantityEdit(
                  quantity: _quantity,
                  decreaseFn: () {
                    if (_quantity == 1) {
                      return;
                    }
                    setState(() => _quantity--);
                  },
                  increaseFn: () {
                    setState(() => _quantity++);
                  },
                ),
                Text(
                  'AED${_productsCon.pDetailsModel!.productSubSkuRequestModels[_selectedPackageIndex].price * _quantity}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: ConstantStrings.kFontFamily,
                  ),
                ),
                const Spacer(),
                CustomBtn(
                  onPressedFn: () async {
                    CartItemModel cModel = CartItemModel(
                      productMasterId:
                          _productsCon.pDetailsModel!.productMasterId,
                      customerId: uModel.customerId,
                      quantity: _quantity.toDouble(),
                      unitPrice: _productsCon
                          .pDetailsModel!
                          .productSubSkuRequestModels[_selectedPackageIndex]
                          .price,
                      productSubSkuId: _productsCon
                          .pDetailsModel!
                          .productSubSkuRequestModels[_selectedPackageIndex]
                          .productSubSkuId,
                      supplierId: _productsCon
                          .pDetailsModel!.supplierRequestModel.supplierId,
                      storeId: _productsCon.pDetailsModel!.storeId,
                    );
                    setState(() => _isAddingtoCart = true);
                    bool isAdded = await _productsCon.addToCart(cModel);
                    if (isAdded) {
                      setState(() => _isAddingtoCart = false);
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => Get.toNamed(CartScreen.routeName),
                      );
                    }
                  },
                  btnTxt: _isAddingtoCart ? 'Processing...' : 'Shop Now',
                  btnSize: Size(135.w, 40.h),
                ),
              ],
            ),
          );
        }
      }
    }));
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        fontFamily: ConstantStrings.kFontFamily,
      ),
    );
  }
}
