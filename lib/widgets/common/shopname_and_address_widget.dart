import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/constants/colors.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';

class ShopnameAndAddressWidget extends StatelessWidget {
  final String shopName;
  final String shopAddress;
  const ShopnameAndAddressWidget({super.key,
  required this.shopName,
  required this.shopAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
        AppText(text: shopName, fontSize: 20, fontWeight: FontWeight.w500),
         SizedBox(height: 5.h),
        AppText(text: shopAddress, fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.black40,),
         SizedBox(height: 3.h),
        Divider(
          color: AppColor.black05,
          thickness: 1,
          height: 20.h,
        ),
      ],
    );
  }
}