import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubramarket_user/core/constants/colors.dart';
import 'package:kubramarket_user/views/home/home_page.dart';
import 'package:provider/provider.dart';

import '../../core/constants/images.dart';
import '../../providers/bottomnav_provider.dart';
import '../cart/cart_page.dart';
import '../orders/my_orders_page.dart';
import '../profile/profile_page.dart';


class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomePage(),
      CartPage(),
      OrderPage(),
      ProfilePage(),
    ];

    return Consumer<BottomNavProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: screens[provider.selectedIndex],
          bottomNavigationBar: Container(
            height: 55.h,
            decoration: BoxDecoration(
              color: AppColor.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5.r,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(context, AppAsset.home, 'Home', 0),
                _buildNavItem(context, AppAsset.cart, 'Cart', 1),
                _buildNavItem(context, AppAsset.order, 'Order', 2),
                _buildNavItem(context, AppAsset.profile, 'Profile', 3),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(BuildContext context, String image, String label, int index) {
    final provider = Provider.of<BottomNavProvider>(context);
    final isSelected = provider.selectedIndex == index;

    return GestureDetector(
      onTap: () => provider.updateIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 22.h,
            width: 22.w,
            color: isSelected ? AppColor.primary : Colors.black,
          ),
          Text(
            label,
            style: GoogleFonts.nunitoSans(
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
              color: isSelected ? AppColor.primary : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
