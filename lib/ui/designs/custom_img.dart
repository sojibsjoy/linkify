import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImg extends StatelessWidget {
  final String imgUrl;
  const CustomImg({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgUrl,
      // loadingBuilder: (context, child, progress) => progress == null
      //     ? child
      //     : Center(
      //         child: CircularProgressIndicator(
      //           value: progress.expectedTotalBytes != null
      //               ? progress.cumulativeBytesLoaded /
      //                   progress.expectedTotalBytes!
      //               : null,
      //         ),
      //       ),
      errorBuilder: ((context, error, stackTrace) {
        return Icon(
          Icons.image,
          size: 30.h,
          color: Colors.grey,
        );
      }),
      width: 348.h,
      fit: BoxFit.fill,
    );
  }
}
