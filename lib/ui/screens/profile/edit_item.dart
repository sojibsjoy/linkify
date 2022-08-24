import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class EditItem extends StatelessWidget {
  final TextEditingController editingCon;
  final String title;
  bool? passField;
  EditItem({
    Key? key,
    required this.editingCon,
    required this.title,
    this.passField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.h,
      padding: EdgeInsets.symmetric(vertical: 5.h),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: ConstantColors.k0F98FF,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14.sp,
                fontFamily: ConstantStrings.kFontFamily,
              ),
            ),
          ),
          CustomField(
            height: 40.h,
            textCon: editingCon,
            hintText: '',
            brdrClr: Colors.transparent,
            txtFontWeight: FontWeight.w600,
            isPassField: passField,
          ),
        ],
      ),
    );
  }
}
