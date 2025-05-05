import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/widgets/common/appbar_widget.dart';
import '../../widgets/cards/order_card.dart';
import '../../widgets/common/header_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppbar(title: "", hasBackButton: false),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(title: "My Orders"),
              SizedBox(height: 10.h),

              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  // final product = products[index];
                  return OrderCard(
  shopName: "Thaibah Enterprises",
  orderDate: "03 May 2025",
  totalAmount: 300,
  status: "Delivered",
  statusColor: Color(0xFF7877CE),
);

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
