import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/constants/colors.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool showIcon;
  final VoidCallback? onIconTap;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.showIcon = false,
    this.onIconTap,
    this.readOnly = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: label,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 6.h),
         SizedBox(
          height: 45.h,
           child: TextField(
             controller: controller,
             readOnly: readOnly,
             style: TextStyle(fontSize: 14.sp),
             decoration: InputDecoration(
               contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 0.h),
               filled: true,
               fillColor: AppColor.white, // consistent bg
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(5.r),
                 borderSide: BorderSide(color: AppColor.black40),
               ),
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10.r),
                 borderSide: BorderSide(color: AppColor.black40),
               ),
               focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10.r),
                 borderSide: BorderSide(color: AppColor.black40), // same color, no glow
               ),
               suffixIcon: showIcon
            ? IconButton(
                icon: Icon(Icons.edit, color: AppColor.black40, size: 20.sp),
                onPressed: onIconTap,
              )
            : null,
             ),
           ),
         )
      
        ],
      ),
    );
  }
}
