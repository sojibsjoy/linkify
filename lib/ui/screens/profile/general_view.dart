import 'package:dogventurehq/states/models/user.dart';
import 'package:dogventurehq/ui/screens/profile/row_item.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class GeneralView extends StatelessWidget {
  final UserModel uModel;
  const GeneralView({
    Key? key,
    required this.uModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addH(60.h),
        // user information
        RowItem(
          prefixTxt: 'Full Name',
          suffixTxt: uModel.firstLastName,
        ),
        RowItem(
          prefixTxt: 'Email',
          suffixTxt: uModel.email,
        ),
        RowItem(
          prefixTxt: 'Mobile Number',
          suffixTxt: uModel.phoneNo,
        ),
        RowItem(
          prefixTxt: 'Password',
          suffixTxt: uModel.password,
        ),
        const RowItem(
          prefixTxt: 'Shop Name',
          suffixTxt: 'Not Found!',
        ),
      ],
    );
  }
}
