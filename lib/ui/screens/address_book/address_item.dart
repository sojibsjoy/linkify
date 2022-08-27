import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/address.dart';
import 'package:dogventurehq/states/models/address.dart';
import 'package:dogventurehq/ui/screens/add_address/add_address.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddressItem extends StatelessWidget {
  final AddressController addressCon;
  final int uID;
  final AddressModel aModel;
  String? suffixText;
  AddressItem({
    Key? key,
    required this.addressCon,
    required this.uID,
    required this.aModel,
    this.suffixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 388.w,
      height: 100.h,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ConstantColors.kF3F3F3,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Address Icon
          SizedBox(
            width: 50.w,
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/address_icon.svg',
              ),
            ),
          ),
          // Address Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 330.w,
                height: 20.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Address Title
                    Text(
                      aModel.addressType,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: ConstantStrings.kFontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Edit & Delete Icon
                    SizedBox(
                      width: suffixText == null ? 55.w : 80.w,
                      height: 20.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Get.toNamed(
                              AddAddress.routeName,
                              arguments: aModel,
                            )!
                                .then(
                              (value) => addressCon.getAddresses(
                                customerID: uID,
                              ),
                            ),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: SvgPicture.asset(
                              'assets/svgs/edit.svg',
                            ),
                          ),
                          if (suffixText == null)
                            InkWell(
                              onTap: () {
                                addressCon.deleteDeliveryAddress(
                                  addressID: aModel.customerAddressId,
                                );
                                Get.defaultDialog(
                                  title: 'Deleting...',
                                  content: Obx(
                                    () {
                                      if (addressCon
                                          .deleteAddressLoading.value) {
                                        return SizedBox(
                                          height: 100.h,
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      } else {
                                        Future.delayed(
                                          const Duration(seconds: 1),
                                          () {
                                            Get.back();
                                            addressCon.addressList.remove(
                                              aModel,
                                            );
                                          },
                                        );
                                        return const Center(
                                          child: Text(
                                            'Address Deleted Successfully',
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                );
                              },
                              child: SvgPicture.asset(
                                'assets/svgs/delete.svg',
                              ),
                            ),
                          if (suffixText != null)
                            Text(
                              suffixText!,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 13.sp,
                                fontFamily: ConstantStrings.kFontFamily,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              addH(5.h),
              Text(
                "${aModel.buildingName} ${aModel.nearByLocation}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontFamily: ConstantStrings.kFontFamily,
                ),
              ),
              addH(5.h),
              Text(
                'Phone Number: ${aModel.phoneNumber}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: ConstantStrings.kFontFamily,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
