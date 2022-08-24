import 'package:dogventurehq/ui/screens/profile/row_item.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class GeneralView extends StatelessWidget {
  const GeneralView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addH(60.h),
        // user information
        const RowItem(
          prefixTxt: 'Full Name',
          suffixTxt: 'Sherif Rahman',
        ),
        const RowItem(
          prefixTxt: 'Email',
          suffixTxt: 'test@royex.net',
        ),
        const RowItem(
          prefixTxt: 'Mobile Number',
          suffixTxt: '+966 01-2050876',
        ),
        const RowItem(
          prefixTxt: 'Password',
          suffixTxt: '**********',
        ),
        const RowItem(
          prefixTxt: 'Shop Name',
          suffixTxt: 'Khalid Stores',
        ),
      ],
    );
  }
}
