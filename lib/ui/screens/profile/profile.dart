import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/user.dart';
import 'package:dogventurehq/ui/designs/custom_title.dart';
import 'package:dogventurehq/ui/screens/profile/edit_view.dart';
import 'package:dogventurehq/ui/screens/profile/general_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _showEditView = false;
  UserModel? uModel;

  @override
  void initState() {
    uModel = Preference.getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitle(
                  title: 'My Profile',
                  suffixIcon: _showEditView
                      ? 'assets/svgs/tick.svg'
                      : 'assets/svgs/edit.svg',
                  siffixSize: _showEditView ? 18 : 25,
                  suffixOnTapFn: () => setState(
                    () => _showEditView = !_showEditView,
                  ),
                ),
                // dp
                Center(
                  child: Container(
                    width: 80.w,
                    height: 80.h,
                    padding: const EdgeInsets.all(1),
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1.w),
                    ),
                    child: Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/user.png',
                        ),
                      ),
                    ),
                  ),
                ),
                // user name
                if (!_showEditView)
                  Center(
                    child: Text(
                      uModel!.firstLastName,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: ConstantStrings.kFontFamily,
                      ),
                    ),
                  ),
                _showEditView
                    ? const EditView()
                    : GeneralView(
                        uModel: uModel!,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
