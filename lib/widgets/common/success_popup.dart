import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/constants/colors.dart';
import 'package:kubramarket_user/widgets/common/button_widget.dart';

import 'apptext_widget.dart';

class SuccessDialog extends StatelessWidget {
  final String message;
  final VoidCallback onContinue;

  const SuccessDialog({
    super.key,
    required this.message,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.primary,
              radius: 40.r,
              child: Icon(Icons.check, color: AppColor.white, size: 50.sp),
            ),
            SizedBox(height: 30.h),
            AppText(
              text: "Order Successful",
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          
            AppText(text: message, fontSize: 16.sp, color: AppColor.black),
            SizedBox(height: 25.h),
          

            NormalButton(
              
              text: "Continue Shopping",
               color: AppColor.primary,
                fontSize: 14, 
                onPressed: onContinue,
                 width: 200, height: 32, radius: 10, isOutlineButton: false),
          ],
        
        ),
      ),
    );
  }
}
