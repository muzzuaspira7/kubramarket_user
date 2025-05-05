import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/constants/colors.dart';
import 'package:kubramarket_user/widgets/common/appbar_widget.dart';
import 'package:kubramarket_user/widgets/common/button_widget.dart';
import '../../core/utils/navigation_service.dart';
import '../../widgets/cards/cart_item_card.dart';
import '../../widgets/common/header_widget.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  bool addingCart = true;

  CartPage({this.addingCart = false, super.key});

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
              Row(
                children: [
                  addingCart ?
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: GestureDetector(
                      onTap: () {
                        NavigationService.pop(context);
                      },
                      child: Icon(Icons.arrow_back, size: 30),
                    ),
                  ) : SizedBox(),


                  HeaderWidget(title: "Cart"),
                ],
              ),
              SizedBox(height: 10.h),

              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  // final product = products[index];
                  return CartCard(
                    imageUrl:
                        "https://plus.unsplash.com/premium_photo-1680098057218-070cf9a653f7?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    title: "THAIBAH ENTERPRISES",
                    description: "Clay Pot",
                    price: 300.toDouble(),
                    onTap: () {},
                  );
                },
              ),
                addingCart ?
                Center(
                  child: NormalButton(text: "Apply Offer", color: AppColor.primary, fontSize: 14, onPressed: (){},
                  height: 35, width: 200
                  ),
                ) : SizedBox()
             ],
          ),
        ),
      ),
    );
  }
}
