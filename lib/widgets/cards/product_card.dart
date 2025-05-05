import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';
import 'package:kubramarket_user/widgets/common/button_widget.dart';

import '../../core/constants/colors.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h),
      child: Card(
        color: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        elevation: 0,
        
        // elevation: 0.5,
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              Image.network(
                imageUrl,
                width: 105.w,
                height: 115.h,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      text: title,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                    SizedBox(height: 5.h),
                    AppText(
                      text: description,
                      fontSize: 13.sp,
                      maxLines: 2,
                    ),
                    SizedBox(height: 5.h),
                    AppText(
                      text: "₹ ${price.toStringAsFixed(2)}",
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                       NormalButton(
                        radius: 5,
                        height: 25,
                        width: 130,
                          text: "Add to Cart",
                          onPressed: onTap,
                          fontSize: 13, color: AppColor.primary,
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
