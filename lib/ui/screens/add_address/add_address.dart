import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/address.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/address.dart';
import 'package:dogventurehq/states/models/city.dart';
import 'package:dogventurehq/states/models/country.dart';
import 'package:dogventurehq/states/models/state.dart';
import 'package:dogventurehq/states/models/user.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_dd.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/designs/custom_title.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddAddress extends StatefulWidget {
  static String routeName = '/add_address';
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final AddressController _addressCon = Get.find<AddressController>();
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _phoneNumCon = TextEditingController();
  final TextEditingController _villaCon = TextEditingController();
  final TextEditingController _extraDirectionsCon = TextEditingController();

  bool _firstTime = true;

  CountryModel? _selectedCountry;
  StateModel? _selectedState;
  CityModel? _selectedCity;
  AddressModel? aModel;
  UserModel? userModel;

  @override
  void initState() {
    userModel = Preference.getUserDetails();
    if (Get.arguments != null) {
      aModel = Get.arguments;
      _titleCon.text = aModel!.addressType;
      _phoneNumCon.text = aModel!.phoneNumber;
      _villaCon.text = aModel!.buildingName;
      _extraDirectionsCon.text = aModel!.nearByLocation;
    }
    _addressCon.getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                CustomTitle(
                  title: aModel == null ? 'Add Address' : 'Edit Address',
                ),
                // Address Form
                Text(
                  'Where Should we deliver your order?',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: ConstantStrings.kFontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                addH(16.h),
                // Address title
                CustomField(
                  textCon: _titleCon,
                  prefixIcon: 'assets/svgs/address_title.svg',
                  hintText: 'Address Title',
                  brdrClr: ConstantColors.k06C8FF,
                ),
                addH(16.h),
                // Phone number
                CustomField(
                  textCon: _phoneNumCon,
                  prefixIcon: 'assets/svgs/phone_num.svg',
                  hintText: 'Phone Number',
                  brdrClr: ConstantColors.k06C8FF,
                ),
                addH(16.h),
                // Country dropdown
                Obx(() {
                  if (_addressCon.countryLoading.value) {
                    return SizedBox(
                      width: 388.w,
                      height: 50.h,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (aModel != null && _firstTime) {
                      for (CountryModel item in _addressCon.countryList) {
                        if (item.countryId == aModel!.countryId) {
                          _selectedCountry = item;

                          Future.delayed(
                            const Duration(milliseconds: 100),
                            () => _addressCon.getStates(
                                countryID: item.countryId),
                          );
                          break;
                        }
                      }
                    }
                    return CustomDD(
                      givenValue: _selectedCountry,
                      hintTxt: "Country",
                      onChangedFn: (value) => setState(() {
                        _selectedCountry = value;
                        _addressCon.stateList.clear();
                        _selectedState = null;
                        _addressCon.cityList.clear();
                        _selectedCity = null;
                        _addressCon.getStates(
                          countryID: _selectedCountry!.countryId,
                        );
                      }),
                      items: _addressCon.countryList.map((e) {
                        return _getDDMenuItem(
                          item: e,
                          txt: e.countryName,
                        );
                      }).toList(),
                    );
                  }
                }),
                addH(16.h),
                // State dropdown
                Obx(() {
                  if (_addressCon.stateLoading.value) {
                    return SizedBox(
                      width: 388.w,
                      height: 50.h,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (aModel != null &&
                        _firstTime &&
                        _selectedCountry != null) {
                      for (StateModel item in _addressCon.stateList) {
                        if (item.stateId == aModel!.stateId) {
                          _selectedState = item;
                          Future.delayed(
                            const Duration(milliseconds: 100),
                            () => _addressCon.getCities(stateID: item.stateId),
                          );
                          break;
                        }
                      }
                    }
                    return CustomDD(
                      givenValue: _selectedState,
                      hintTxt: "State",
                      onChangedFn: (value) => setState(() {
                        _selectedState = value;
                        _addressCon.cityList.clear();
                        _selectedCity = null;
                        _addressCon.getCities(
                          stateID: _selectedState!.stateId,
                        );
                      }),
                      items: _addressCon.stateList.map((e) {
                        return _getDDMenuItem(
                          item: e,
                          txt: e.stateName,
                        );
                      }).toList(),
                    );
                  }
                }),
                addH(16.h),
                // City dropdown
                Obx(() {
                  if (_addressCon.cityLoading.value) {
                    return SizedBox(
                      width: 388.w,
                      height: 50.h,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (aModel != null &&
                        _firstTime &&
                        _selectedState != null) {
                      for (CityModel item in _addressCon.cityList) {
                        if (item.cityId == aModel!.cityId) {
                          _selectedCity = item;
                          _firstTime = false;
                          break;
                        }
                      }
                    }
                    return CustomDD(
                      givenValue: _selectedCity,
                      hintTxt: "City",
                      onChangedFn: (value) => setState(() {
                        _selectedCity = value;
                      }),
                      items: _addressCon.cityList.map((e) {
                        return _getDDMenuItem(
                          item: e,
                          txt: e.cityName,
                        );
                      }).toList(),
                    );
                  }
                }),
                addH(16.h),
                // Villa
                CustomField(
                  textCon: _villaCon,
                  prefixIcon: 'assets/svgs/villa_number.svg',
                  hintText: 'Villa',
                  brdrClr: ConstantColors.k06C8FF,
                ),
                addH(16.h),
                // Extra directions
                CustomField(
                  textCon: _extraDirectionsCon,
                  prefixIcon: 'assets/svgs/extra_directions.svg',
                  hintText: 'Extra Directions',
                  brdrClr: ConstantColors.k06C8FF,
                ),
                addH(16.h),
                // Current Location
                Container(
                  width: 388.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        // Current Location Button
                        Container(
                          height: 60.h,
                          padding: EdgeInsets.only(top: 15.h, left: 15.w),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/current_location.svg',
                              ),
                              addW(10.w),
                              Text(
                                'Current Location',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: ConstantStrings.kFontFamily,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Map
                        Expanded(
                          child: Container(
                            color: Colors.grey,
                            child: Center(
                              child: Text(
                                'Map',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: ConstantStrings.kFontFamily,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                addH(45.h),
                // Save Button
                Center(
                  child: CustomBtn(
                    onPressedFn: () {
                      if (_titleCon.text.isEmpty ||
                          _phoneNumCon.text.isEmpty ||
                          _selectedCountry == null ||
                          _selectedState == null ||
                          _selectedCity == null ||
                          _villaCon.text.isEmpty ||
                          _extraDirectionsCon.text.isEmpty) {
                        Methods.showSnackbar(msg: ConstantStrings.kEmptyFields);
                        return;
                      }
                      AddressModel addressModel = AddressModel(
                        customerAddressId:
                            aModel == null ? 0 : aModel!.customerAddressId,
                        customerId: userModel!.customerId,
                        addressType: _titleCon.text,
                        phoneNumber: _phoneNumCon.text,
                        countryId: _selectedCountry!.countryId,
                        countryName: _selectedCountry!.countryName,
                        stateId: _selectedState!.stateId,
                        stateName: _selectedState!.stateName,
                        cityId: _selectedCity!.cityId,
                        cityName: _selectedCity!.cityName,
                        buildingName: _villaCon.text,
                        nearByLocation: _extraDirectionsCon.text,
                        latitude: 0,
                        longitude: 0,
                      );
                      _addressCon.saveDeliveryAddress(
                        addressModel: addressModel,
                        isUpdating: aModel != null,
                      );
                      Get.defaultDialog(
                        title: 'Processing...',
                        content: Obx(
                          () {
                            if (_addressCon.saveAddressLoading.value) {
                              return SizedBox(
                                height: 100.h,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else {
                              Future.delayed(
                                const Duration(seconds: 2),
                                () => Get.back(),
                              );
                              return Center(
                                child: Text(
                                  aModel == null
                                      ? 'Address Saved!'
                                      : 'Address Updated!',
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
                    btnTxt: aModel == null ? 'Save' : 'Update',
                  ),
                ),
                addH(30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static DropdownMenuItem<dynamic> _getDDMenuItem({
    required dynamic item,
    required String txt,
  }) {
    return DropdownMenuItem(
      value: item,
      child: Row(
        children: [
          addW(15.w),
          SvgPicture.asset(
            'assets/svgs/location.svg',
          ),
          addW(20.w),
          Text(
            txt,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
