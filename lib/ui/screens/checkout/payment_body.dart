import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentBody extends StatefulWidget {
  const PaymentBody({Key? key}) : super(key: key);

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  List<String> paymentOptions = [
    'Cash on Delivery',
    'Online Payment',
    'Linkify Wallet',
  ];
  int selectedPaymentOption = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: ConstantStrings.kFontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        addH(10.h),
        Column(
          children: paymentOptions
              .map(
                (e) => Row(
                  children: [
                    Radio(
                      value: paymentOptions.indexOf(e),
                      groupValue: selectedPaymentOption,
                      onChanged: (value) => setState(
                        () => selectedPaymentOption = value as int,
                      ),
                    ),
                    Text(
                      e,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    // Radio button
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
