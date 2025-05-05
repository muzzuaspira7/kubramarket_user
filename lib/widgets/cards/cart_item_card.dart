import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';
import 'package:kubramarket_user/core/constants/colors.dart';

class CartCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  final VoidCallback onTap;

  const CartCard({
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
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Card(
        color: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
          side: BorderSide(color: AppColor.black05, width: 1),
        ),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Image.asset(
                      "assets/cross.png",
                      width: 25.w,
                      height: 25.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              // Product Row
              Row(
                children: [
                  Image.network(
                    imageUrl,
                    width: 100.w,
                    height: 110.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: "Clay Pot",
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                            AppText(
                              text: "₹ ${price.toStringAsFixed(2)}",
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
      
                        SizedBox(height: 8.h),
      
                        Container(
                          height: 25.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.black40),
                          ),
                          child: Row(
                            children: [
                              // Minus Button
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: AppColor.black40),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    size: 20.sp,
                                    color: AppColor.black40,
                                  ),
                                ),
                              ),
                              // Quantity
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: AppText(
                                    text: "2",
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // Plus Button
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 20.sp,
                                    color: AppColor.black40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
      
                        AppText(
                          text: "Delivery: Free",
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 10.h),
      
                        // Counter Widget
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
