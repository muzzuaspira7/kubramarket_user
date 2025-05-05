import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/widgets/common/appbar_widget.dart';
import 'package:kubramarket_user/widgets/common/button_widget.dart';
import '../../core/constants/colors.dart';
import '../../core/utils/navigation_service.dart';
import '../../widgets/common/apptext_widget.dart';

class OrderDetailPage extends StatelessWidget {
  final String shopName;
  final String status;
  const OrderDetailPage({super.key, required this.shopName, required this.status});

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
                  child: Icon(Icons.arrow_back, size: 30),
                ),
                SizedBox(width: 10),
                AppText(
                  text: "Order Detail",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: 20),
            _basicOrderDetailCard(
              "#1903809",
              "20 Apr 2025, 12:30 PM",
              shopName,
            ),
            _productCard(
              "Wicker Basket",
              "https://images.unsplash.com/photo-1626037235530-fe56de7d6459?q=80&w=1527&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              2,
              "200",
            ),
            _address("1/92 2nd Street, Bangishop Road"),
            _orderSummary("600", "20"),
            NormalButton(
              text: status,
              color: status == "Delivered" ? Color(0xff7877ce) : Colors.redAccent, fontSize: 12,
              height: 30,
              width: 100,
               onPressed: (){})
          ],
        ),
      ),
    );
  }
}

Widget _basicOrderDetailCard(String orderId, String dateTime, String shopName) {
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
                text: "Order Id: $orderId",
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 4.h),
              AppText(
                text: dateTime,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 4.h),
              AppText(
                text: "Shop: $shopName",
                fontSize: 17,
                maxLines: 2,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _address(String address) {
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
                text: "Delivery Address:",
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 4.h),
              AppText(text: address, fontSize: 14, fontWeight: FontWeight.w400),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _productCard(
  String productName,
  String productImage,
  int productQuantity,
  String productPrice,
) {
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
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Info
          Image.network(
            productImage,
            width: 100.w,
            height: 110.h,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: productName,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4.h),
                AppText(
                  text: "₹ $productPrice",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),

                AppText(
                  text: "Qty: $productQuantity",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _orderSummary(String totalItem, String deliveryFee) {
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
                text: "Order Summary",
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 4.h),
              _reusableRow("Total Items: ", totalItem, false),
              SizedBox(height: 4.h),
              _reusableRow("Delivery Fee: ", deliveryFee, false),
              SizedBox(height: 4.h),
              _reusableRow("Total: ", "620", true),
              SizedBox(height: 4.h),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _reusableRow(String title, String value, bool isTotal) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: 290.w,
        child: AppText(
          text: title,
          fontSize: 14,
          fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
      AppText(
        text: "₹ $value",
        fontSize: 16,
        fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
      ),
    ],
  );
}
