import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/data/dummyorder_data.dart';
import 'package:kubramarket_user/core/utils/navigation_service.dart';
import 'package:kubramarket_user/views/orders/order_detail_page.dart';
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
                itemCount: dummyOrders.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final order = dummyOrders[index];
                  return GestureDetector(
                    onTap: (){
                      NavigationService.push(context, OrderDetailPage(shopName: order['shopName'], status: order['status'],));
                    },
                    child: OrderCard(
                      shopName: order['shopName'],
                      orderDate: order['orderDate'],
                      totalAmount: order['totalAmount'],
                      status: order['status'],
                      statusColor:
                          order['status'] == "Delivered"
                              ? Color(0xFF7877CE)
                              : order['status'] == "Cancelled"
                              ? Colors.red
                              : Color(0xFFFE887D),
                    ),
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
