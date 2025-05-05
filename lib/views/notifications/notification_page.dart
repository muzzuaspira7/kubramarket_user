import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/utils/navigation_service.dart';
import 'package:kubramarket_user/widgets/cards/notification_card.dart';
import 'package:kubramarket_user/widgets/common/appbar_widget.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppbar(title: "", hasBackButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    NavigationService.pop(context);
                  },
                  child: Icon(Icons.arrow_back, size: 30)),
                SizedBox(width: 10),
                AppText(text: "Notifications", fontSize: 20, fontWeight: FontWeight.w600),
              ],
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
              
              return NotificationCard(title: "Order Delivered", subtitle: "Your Order has been Delivered");
            },)
          ],
        ),
      ),
    );
  }
}