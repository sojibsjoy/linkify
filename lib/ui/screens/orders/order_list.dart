import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/order_response.dart';
import 'package:dogventurehq/ui/designs/custom_item.dart';
import 'package:dogventurehq/ui/screens/orders/row_text.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderList extends StatelessWidget {
  final RxBool loadingFlag;
  final RxList<OrderResponseModel> orderList;
  const OrderList({
    Key? key,
    required this.loadingFlag,
    required this.orderList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (loadingFlag.value) {
        return Padding(
          padding: EdgeInsets.only(top: 300.h),
          child: const CircularProgressIndicator(),
        );
      } else {
        if (orderList.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(top: 300.h),
            child: Text(ConstantStrings.kNoData),
          );
        } else {
          return Expanded(
            child: ListView.builder(
              itemCount: orderList.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomItem(
                  imgLink:
                      orderList[index].invoiceDetailsViewModels[0].largeImage,
                  productName:
                      orderList[index].invoiceDetailsViewModels[0].productName,
                  price: orderList[index].totalAmount,
                  deleteIconFn: () {
                    // TODO: add delete function
                  },
                  child: SizedBox(
                    width: 265.w,
                    child: Column(
                      children: [
                        const RowText(
                          text1: 'Invoice Number',
                          text2: 'Expected Delivery',
                          isBold: false,
                        ),
                        addH(5.h),
                        RowText(
                          text1: orderList[index].refNumber,
                          text2: orderList[index]
                              .invoiceDate
                              .add(const Duration(days: 5))
                              .toString()
                              .substring(0, 10)
                              .split('-')
                              .reversed
                              .join('-'),
                          isBold: true,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }
    });
  }
}
