import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/widgets/common/appbar_widget.dart';
import 'package:kubramarket_user/widgets/common/shopname_and_address_widget.dart';
import '../../core/data/products_data.dart';
import '../../widgets/cards/product_card.dart';
class ShopProductsPage extends StatelessWidget {
  final String shopName;
  final String shopAddress;

  const ShopProductsPage({
    super.key,
    required this.shopName,
    required this.shopAddress,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>>? products = dummyProducts[shopName];

    return Scaffold(
      appBar: ReusableAppbar(title: "", hasBackButton: false),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: ShopnameAndAddressWidget(
                  shopName: shopName,
                  shopAddress: shopAddress,
                ),
              ),
              SizedBox(height: 20.h),
              if (products == null || products.isEmpty)
                Center(child: Text("No products found, boss 😶"))
              else
                ListView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      imageUrl: product['imageUrl'],
                      title: product['title'],
                      description: product['description'],
                      price: product['price'].toDouble(),
                      onTap: () {
                      },
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
