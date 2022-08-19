import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImg extends StatelessWidget {
  final String imgUrl;
  BoxFit? imgFit;
  CustomImg({
    Key? key,
    required this.imgUrl,
    this.imgFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgUrl,
      loadingBuilder: (context, child, progress) => progress == null
          ? child
          : Center(
              child: CircularProgressIndicator(
                value: progress.expectedTotalBytes != null
                    ? progress.cumulativeBytesLoaded /
                        progress.expectedTotalBytes!
                    : null,
              ),
            ),
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.image,
        size: 30.h,
        color: Colors.grey,
      ),
      width: 348.h,
      fit: imgFit ?? BoxFit.fill,
    );
  }
}
