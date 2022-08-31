import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/user.dart';
import 'package:dogventurehq/ui/screens/address_book/address_book.dart';
import 'package:dogventurehq/ui/screens/categories/categories.dart';
import 'package:dogventurehq/ui/screens/home/drawer_menu.dart';
import 'package:dogventurehq/ui/screens/home/logo.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/orders/orders.dart';
import 'package:dogventurehq/ui/screens/profile/profile.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class HomeDrawer extends StatelessWidget {
  final UserModel userDetails;
  HomeDrawer({
    Key? key,
    required this.userDetails,
  }) : super(key: key);

  final List<String> _menuIcons = [
    // section 1
    'assets/svgs/home.svg',
    'assets/svgs/categories.svg',
    'assets/svgs/notifications.svg',
    'assets/svgs/order_history.svg',
    'assets/svgs/wishlist.svg',
    // section 2
    'assets/svgs/my_account.svg',
    'assets/svgs/address_book.svg',
    'assets/svgs/share.svg',
    'assets/svgs/about_us.svg',
    'assets/svgs/log_out.svg',
  ];
  final List<String> _menuTitle = [
    // section 1
    'Home',
    'Categories',
    'Notifications',
    'Order History',
    'Wishlist',
    // section 2
    'My Account',
    'Address Book',
    'Share',
    'About Us',
    'Log Out',
  ];
  final List<VoidCallback> _menuOnTapFns = [
    // section 1
    () => Get.back(),
    () => Get.toNamed(CategoriesScreen.routeName),
    () => print('Notifications'),
    () => Get.toNamed(Orders.routeName),
    () => print('Wishlist'),
    // section 2
    () => Get.toNamed(ProfileScreen.routeName),
    () => Get.toNamed(AddressBookScreen.routeName),
    () => print('Share'),
    () => print('About Us'),
    () => AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.WARNING,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Log Out',
          desc: 'Are you sure want to log out?',
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            Get.offAllNamed(LoginScreen.routeName);
            Preference.logOut();
          },
        ).show(),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350.w,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ConstantColors.k2377A6,
          width: 1,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(43.r),
          bottomRight: Radius.circular(43.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drawer Header
          SizedBox(
            height: 194.h,
            width: double.infinity,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/drawer_bg.png',
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Center(
                  child: Row(
                    children: [
                      addW(30.w),
                      // Menu
                      InkWell(
                        onTap: () => Get.back(),
                        child: SizedBox(
                          width: 22.w,
                          height: 20.h,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/svgs/drawer_menu.svg',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      addW(46.w),
                      // Logo
                      const HomeLogo(),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Drawer Body
          // Store title
          buildMenuTitle('STORE'),
          // Menu Section 1
          SizedBox(
            height: 255.h,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, index) {
                return DrawerMenu(
                  onTapFn: _menuOnTapFns[index],
                  title: _menuTitle[index],
                  icon: _menuIcons[index],
                );
              },
            ),
          ),
          // Divider
          buildDivider(),
          addH(10.h),
          // Account title
          buildMenuTitle('ACCOUNT'),
          // Menu Section 2
          SizedBox(
            height: 255.h,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, index) {
                return DrawerMenu(
                  onTapFn: _menuOnTapFns[5 + index],
                  title: _menuTitle[5 + index],
                  icon: _menuIcons[5 + index],
                );
              },
            ),
          ),
          // Divider
          buildDivider(),
          // User Account
          Container(
            width: 310.w,
            height: 68.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: ConstantColors.k2377A6,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(53.r),
            ),
            child: Row(
              children: [
                addW(3.w),
                // User Image
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/user.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                addW(18.w),
                // User Name
                SizedBox(
                  width: 200.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        userDetails.firstLastName,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        userDetails.email,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Menu Icon
                SvgPicture.asset(
                  'assets/svgs/menu.svg',
                  color: Colors.black,
                ),
                addW(20.w),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: Colors.grey,
      thickness: 0.2,
      indent: 15.w,
      endIndent: 15.w,
    );
  }

  Widget buildMenuTitle(
    String title,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: ConstantColors.k2377A6,
        ),
      ),
    );
  }
}
