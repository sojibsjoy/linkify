import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 152.w,
      height: 24.h,
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
    );
  }
}
