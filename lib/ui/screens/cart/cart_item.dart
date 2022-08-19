import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 101;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 388.w,
      height: 120.h,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: ConstantColors.kF3F3F3,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              image: const DecorationImage(
                image: AssetImage('assets/images/watch.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          addW(10.h),
          // Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Title
              Text(
                'Crown Summit Backpack',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: ConstantStrings.kFontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Price
              Text(
                'Price: AED99.00',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
              // Quantity
              SizedBox(
                width: 200.w,
                height: 30.h,
                child: Row(
                  children: [
                    // Remove Icon
                    InkWell(
                      onTap: () {
                        if (quantity > 1) {
                          setState(() => quantity--);
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ConstantColors.kF3F3F3,
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: quantity == 1 ? Colors.grey : Colors.black,
                          size: 15,
                        ),
                      ),
                    ),
                    // Quantity
                    Container(
                      width: quantity > 99 ? 50.w : 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ConstantColors.kF3F3F3,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$quantity',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    // Add Icon
                    InkWell(
                      onTap: () {
                        setState(() => quantity++);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ConstantColors.kF3F3F3,
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          // Delete
          Container(
            width: 20.w,
            height: 20.h,
            margin: EdgeInsets.only(right: 10.w, top: 15.h),
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/delete.svg',
                color: ConstantColors.k06C8FF,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
