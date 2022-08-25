import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/checkout/custom_checkbox.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ShippingBody extends StatefulWidget {
  const ShippingBody({Key? key}) : super(key: key);

  @override
  State<ShippingBody> createState() => _ShippingBodyState();
}

class _ShippingBodyState extends State<ShippingBody> {
  bool sameAddressFlag = false;
  bool scheduleFlag = false;
  int selectedAddress = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Shipping Address
        Text(
          'Shipping Address',
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: ConstantStrings.kFontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        addH(10.h),
        // Address List
        SizedBox(
          width: double.infinity,
          height: 285.h,
          child: ListView.builder(
            primary: false,
            itemCount: 2,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 388.w,
                height: 110.h,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    // AddressItem(
                    //   suffixText: 'Change',
                    // ),
                    Container(
                      width: 40.w,
                      height: 40.h,
                      margin: EdgeInsets.only(bottom: 30.h, left: 5.w),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Checkbox(
                        value: selectedAddress == index,
                        onChanged: (value) => setState(
                          () => selectedAddress = index,
                        ),
                        shape: const CircleBorder(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        // My billing address same as shipping address
        SizedBox(
          height: 60.h,
          child: CustomCheckbox(
            initialValue: sameAddressFlag,
            onChangedFn: (value) => setState(() => sameAddressFlag = value!),
            title: 'My billing address same as shipping address',
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey.shade400,
        ),
        addH(10.h),
        CustomCheckbox(
          initialValue: scheduleFlag,
          onChangedFn: (value) => setState(() => scheduleFlag = value!),
          title: 'I want to schedule my delivery',
        ),
        addH(20.h),
        // Schedule delivery
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Delivery Date:',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey.shade600,
                fontFamily: ConstantStrings.kFontFamily,
                fontWeight: FontWeight.w500,
              ),
            ),
            addW(10.w),
            Container(
              width: 115.w,
              height: 35.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(
                  color: ConstantColors.k06C8FF,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '22-07-2022',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kFontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  addW(5.w),
                  Icon(
                    color: Colors.grey.shade700,
                    Icons.calendar_today_outlined,
                    size: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
        addH(80.h),
      ],
    );
  }
}
