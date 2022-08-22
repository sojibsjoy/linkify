import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/designs/custom_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return CustomItem(
      onTapFn: () {
        // TODO: add delete function
      },
      child: // Quantity
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
    );
  }
}
