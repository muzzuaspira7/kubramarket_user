import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/data/featuredshops_data.dart';
import 'package:kubramarket_user/widgets/common/appbar_widget.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';
import 'package:kubramarket_user/widgets/common/button_widget.dart';
import 'package:kubramarket_user/widgets/common/search_bar.dart';
import 'package:provider/provider.dart';
import '../../core/utils/navigation_service.dart';
import '../../providers/shopcategory_provider.dart';
import '../../widgets/cards/featured_shop_card.dart';
import 'shop_products_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ["All", "Crockery", "Snacks", "Clothes"];

    return Scaffold(
      appBar: ReusableAppbar(title: "", hasBackButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableSearchBar(),
            SizedBox(height: 16.h),

            Consumer<ShopCategoryProvider>(
              builder: (context, categoryProvider, _) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        categories.map((cat) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: CategoryButton(
                              text: cat,
                              isSelected:
                                  categoryProvider.selectedCategory == cat,
                              onPressed: () {
                                categoryProvider.setCategory(cat);
                              },
                            ),
                          );
                        }).toList(),
                  ),
                );
              },
            ),

            SizedBox(height: 20.h),
            AppText(
              text: "Featured Shops",
              fontWeight: FontWeight.w500,
              fontSize: 22.sp,
            ),
            SizedBox(height: 12.h),

            Expanded(
              child: Consumer<ShopCategoryProvider>(
                builder: (context, categoryProvider, _) {
                  final filteredShops =
                      categoryProvider.selectedCategory == "All"
                          ? featuredShops
                          : featuredShops
                              .where(
                                (shop) =>
                                    shop['category'] ==
                                    categoryProvider.selectedCategory,
                              )
                              .toList();

                  return GridView.builder(
                    itemCount: filteredShops.length,
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 5.8 / 5,
                    ),
                    itemBuilder: (context, index) {
                      final shop = filteredShops[index];
                      return FeaturedShopCard(
                        imageUrl: shop['imageUrl'] ?? '',
                        title: shop['title'] ?? 'Unknown Shop',
                        onTap: () {
                          NavigationService.push(
                            context,
                            ShopProductsPage(
                              shopAddress: "Jalal Road, Ambur",
                              shopName: shop['title'] ?? '',
                            ),
                          );
                        },
                      );
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