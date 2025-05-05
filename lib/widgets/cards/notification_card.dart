import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';
import 'package:kubramarket_user/core/constants/colors.dart';

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const NotificationCard({
    super.key,
     this.icon = Icons.notifications_none,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6.h),
              shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        elevation: 0,
      color: AppColor.white,
      child: Padding(
        padding: EdgeInsets.all(12.h),
        child: Row(
          children: [
           CircleAvatar(
              backgroundColor: AppColor.primary,
              child: Icon(icon, color: AppColor.white, size: 30.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 4.h),
                  AppText(
                    text: subtitle,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.black,
                  ),
                ],
              ),
            ),
            AppText(text: "2h ago", fontSize: 10, color: AppColor.black40,)
          ],
        ),
      ),
    );
  }
}
