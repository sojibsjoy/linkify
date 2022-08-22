import 'package:dogventurehq/ui/screens/categories/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class FloatingBtn extends StatelessWidget {
  const FloatingBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(CategoriesScreen.routeName),
      child: Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          // shadow
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0.0, 2.0),
              blurRadius: 5.w,
              spreadRadius: 5.w,
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/category.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
