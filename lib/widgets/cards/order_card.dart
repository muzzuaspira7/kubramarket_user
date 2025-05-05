import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/constants/colors.dart' show AppColor;
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';
import 'package:kubramarket_user/widgets/common/button_widget.dart';

// ignore: must_be_immutable
class OrderCard extends StatelessWidget {
  final String shopName;
  final String orderDate;
  final double totalAmount;
  final String status; 
  final Color statusColor;
   double height = 30.h;
   double width = 100.w;

   OrderCard({
    super.key,
    required this.shopName,
    required this.orderDate,
    required this.totalAmount,
    required this.status,
    required this.statusColor,
   this.height = 30,
   this.width = 85,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: shopName,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4.h),
                AppText(
                  text: "Order Date: $orderDate",
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 4.h),
                AppText(
                  text: "₹ ${totalAmount.toStringAsFixed(2)}",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
    
           
         NormalButton(text: status, color: statusColor, fontSize: 12, onPressed: (){}, height: height, width: width, radius: 6,)
         
          ],
        ),
      ),
    );
  }
}
