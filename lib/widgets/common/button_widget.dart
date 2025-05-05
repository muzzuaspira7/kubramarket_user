import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/constants/colors.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';

class NormalButton extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double radius;

  const NormalButton({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.onPressed,
    this.height = 45,
    this.width = 150,
    this.radius = 5
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.r), // Rounded corners
        ),
        minimumSize: Size(width.w, height.h), 
      ),
     
      child: AppText(text: text, fontSize: fontSize.sp, color: AppColor.white,),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategoryButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.primary : Colors.white,
            border: Border.all(
              color: AppColor.primary, 
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
         
          child: AppText(text: text, color: isSelected ? Colors.white : AppColor.primary, fontSize: 18.sp, fontWeight: FontWeight.w400,),
        ),
      ),
    );
  }
}
