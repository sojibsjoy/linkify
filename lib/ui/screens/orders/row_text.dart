import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  final String text1;
  final String text2;
  final bool isBold;
  const RowText({
    Key? key,
    required this.text1,
    required this.text2,
    required this.isBold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: 12.sp,
            color: isBold ? Colors.black : Colors.grey,
            fontWeight: isBold ? FontWeight.bold : null,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            fontSize: 12.sp,
            color: isBold ? Colors.black : Colors.grey,
            fontWeight: isBold ? FontWeight.bold : null,
          ),
        ),
      ],
    );
  }
}
