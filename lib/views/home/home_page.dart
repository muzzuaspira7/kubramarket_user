import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/data/featuredshops_data.dart';
import 'package:kubramarket_user/widgets/common/appbar_widget.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';
import 'package:kubramarket_user/widgets/common/button_widget.dart';
import 'package:kubramarket_user/widgets/common/search_bar.dart';
import '../../core/utils/navigation_service.dart';
import '../../widgets/cards/featured_shop_card.dart';
import 'shop_products_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppbar(title: "", hasBackButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableSearchBar(),
            SizedBox(height: 16.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryButton(text: "All", isSelected: true, onPressed: () {}),
                  CategoryButton(text: "Crockery", isSelected: false, onPressed: () {}),
                  CategoryButton(text: "Snacks", isSelected: false, onPressed: () {}),
                  CategoryButton(text: "Cloths", isSelected: false, onPressed: () {}),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            AppText(
              text: "Featured Shops",
              fontWeight: FontWeight.w500,
              fontSize: 22.sp,
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: GridView.builder(
                itemCount: featuredShops.length,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 5.8 / 5,
                ),
                itemBuilder: (context, index) {
                  final featuredShop = featuredShops[index];
                  final String imageUrl = featuredShop['imageUrl'] ?? '';
                  final String title = featuredShop['title'] ?? 'Unknown Shop';
                  return FeaturedShopCard(
                    imageUrl: imageUrl,
                    title: title,
                    onTap: () {
                      NavigationService.push(context, ShopProductsPage(
                        shopAddress: "Jalal Road, Ambur",
                        shopName: title,
                      ));

                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
