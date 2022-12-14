import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/user.dart';
import 'package:dogventurehq/ui/screens/profile/edit_item.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class EditView extends StatefulWidget {
  final UserModel userModel;
  const EditView({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  final TextEditingController _fNameCon = TextEditingController();
  final TextEditingController _lNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _mobileNoCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  final TextEditingController _shopNameCon = TextEditingController();

  @override
  void initState() {
    _fNameCon.text = widget.userModel.firstName;
    _lNameCon.text = widget.userModel.lastName;
    _emailCon.text = widget.userModel.email;
    _mobileNoCon.text = widget.userModel.phoneNo;
    _passwordCon.text = widget.userModel.password;
    // _shopNameCon.text = widget.userModel.;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addH(25.h),
        Text(
          'PUBLIC INFORMATION',
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            fontFamily: ConstantStrings.kFontFamily,
          ),
        ),
        addH(25.h),
        EditItem(editingCon: _fNameCon, title: 'First Name'),
        EditItem(editingCon: _lNameCon, title: 'Last Name'),
        EditItem(editingCon: _emailCon, title: 'Email'),
        EditItem(editingCon: _mobileNoCon, title: 'Mobile Number'),
        EditItem(
          editingCon: _passwordCon,
          title: 'Password',
          passField: true,
        ),
        EditItem(editingCon: _shopNameCon, title: 'Shop Name'),
      ],
    );
  }
}
