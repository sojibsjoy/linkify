import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/designs/custom_title.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class AddAddress extends StatefulWidget {
  static String routeName = '/add_address';
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _phoneNumCon = TextEditingController();
  final TextEditingController _countryCon = TextEditingController();
  final TextEditingController _cityCon = TextEditingController();
  final TextEditingController _villaCon = TextEditingController();
  final TextEditingController _extraDirectionsCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                CustomTitle(
                  title: 'Add or Edit Address',
                ),
                // Address Form
                Text(
                  'Where Should we deliver your order?',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: ConstantStrings.kFontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                addH(16.h),
                // Address title
                CustomField(
                  textCon: _titleCon,
                  prefixIcon: 'assets/svgs/address_title.svg',
                  hintText: 'Address Title',
                  brdrClr: ConstantColors.k06C8FF,
                ),
                addH(16.h),
                // Phone number
                CustomField(
                  textCon: _phoneNumCon,
                  prefixIcon: 'assets/svgs/phone_num.svg',
                  hintText: 'Phone Number',
                  brdrClr: ConstantColors.k06C8FF,
                ),
                addH(16.h),
                // Country
                CustomField(
                  textCon: _countryCon,
                  prefixIcon: 'assets/svgs/location.svg',
                  hintText: 'Country',
                  brdrClr: ConstantColors.k06C8FF,
                ),
                addH(16.h),
                // City
                CustomField(
                  textCon: _cityCon,
                  prefixIcon: 'assets/svgs/location.svg',
                  hintText: 'City',
                  brdrClr: ConstantColors.k06C8FF,
                ),
                addH(16.h),
                // Villa
                CustomField(
                  textCon: _villaCon,
                  prefixIcon: 'assets/svgs/villa_number.svg',
                  hintText: 'Villa',
                  brdrClr: ConstantColors.k06C8FF,
                ),
                addH(16.h),
                // Extra directions
                CustomField(
                  textCon: _extraDirectionsCon,
                  prefixIcon: 'assets/svgs/extra_directions.svg',
                  hintText: 'Extra Directions',
                  brdrClr: ConstantColors.k06C8FF,
                ),
                addH(16.h),
                // Current Location
                Container(
                  width: 388.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        // Current Location Button
                        Container(
                          height: 60.h,
                          padding: EdgeInsets.only(top: 15.h, left: 15.w),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/current_location.svg',
                              ),
                              addW(10.w),
                              Text(
                                'Current Location',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: ConstantStrings.kFontFamily,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Map
                        Expanded(
                          child: Container(
                            color: Colors.grey,
                            child: Center(
                              child: Text(
                                'Map',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: ConstantStrings.kFontFamily,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                addH(75.h),
                // Save Button
                Center(
                  child: CustomBtn(
                    onPressedFn: () {
                      // TODO: Save address
                      Get.back();
                    },
                    btnTxt: 'Save',
                  ),
                ),
                addH(40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
