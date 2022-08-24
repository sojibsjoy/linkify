import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class DescriptionItem extends StatelessWidget {
  const DescriptionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Brand:',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
            Text(
              'Amazfit',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade700,
              ),
            )
          ],
        ),
        Divider(
          color: Colors.grey.shade300,
          thickness: 1,
        ),
      ],
    );
  }
}
