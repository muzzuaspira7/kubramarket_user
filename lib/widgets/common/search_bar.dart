import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/constants/colors.dart';  // Your color constants file

class ReusableSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const ReusableSearchBar({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: TextField(
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: Colors.black54,
          ),
          filled: true,
          fillColor: AppColor.black05,
          suffixIcon: Icon(
            Icons.search,
            color: Colors.black54,
            size: 26.sp, 
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColor.black40),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.black45),
          ),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
