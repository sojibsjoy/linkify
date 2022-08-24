import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final String name, subTxt, date;
  final bool dividerFlag;
  const RatingItem({
    Key? key,
    required this.name,
    required this.subTxt,
    required this.date,
    required this.dividerFlag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name - $date',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                    fontFamily: ConstantStrings.kFontFamily,
                  ),
                ),
                Text(
                  subTxt,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade400,
                    fontFamily: ConstantStrings.kFontFamily,
                  ),
                )
              ],
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              allowHalfRating: true,
              itemSize: 20,
              unratedColor: ConstantColors.k2377A6,
              itemBuilder: (_, value) {
                return Icon(
                  value < 3 ? Icons.star : Icons.star_outline,
                  color: ConstantColors.k2377A6,
                );
              },
              onRatingUpdate: (value) {},
            ),
          ],
        ),
        if (dividerFlag)
          Divider(
            thickness: 1,
            color: Colors.grey.shade300,
          ),
      ],
    );
  }
}
