import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/utils/navigation_service.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/images.dart';
import '../../views/notifications/notification_page.dart';


class ReusableAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasBackButton;

  const ReusableAppbar({
    super.key,
    required this.title,
    required this.hasBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColor.white,
      automaticallyImplyLeading: hasBackButton, 
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppAsset.logo, width: 140.w, height: 140.h),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: title),
       
            ],
          ),
        ],
      ),
      actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: CircleAvatar(
                        backgroundColor: AppColor.black05,
                        child: IconButton(
                          onPressed: () {
                            // Handle notification button press
                            NavigationService.push(context, NotificationPage());
                          },
                          icon: const Icon(Icons.notifications_none, color: AppColor.primary),
                        ),
                      ),
                    )
    
      ],
      leading: hasBackButton
          ? InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: CircleAvatar(
                  backgroundColor: AppColor.black,
                  radius: 50.r,
                  child: Icon(Icons.arrow_back),
                ),
              ),
            )
          : null,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
