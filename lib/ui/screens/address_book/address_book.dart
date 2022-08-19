import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_title.dart';
import 'package:dogventurehq/ui/screens/add_address/add_address.dart';
import 'package:dogventurehq/ui/screens/address_book/address_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class AddressBookScreen extends StatelessWidget {
  static String routeName = '/address_book';
  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            // Title
            CustomTitle(
              title: 'Address Book',
              suffixIcon: 'assets/svgs/search_suffix.svg',
              // suffixOnTapFn: () => Get.toNamed(SearchScreen.routeName),
            ),
            // Address List Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Address Book',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: ConstantStrings.kFontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Add Address Btn
                InkWell(
                  onTap: () => Get.toNamed(AddAddress.routeName),
                  child: Container(
                    width: 135.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: ConstantColors.k06C8FF,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Add New Address',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: ConstantStrings.kFontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Address List
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return AddressItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
