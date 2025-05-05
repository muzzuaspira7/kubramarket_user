import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/constants/colors.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';

class FeaturedShopCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  const FeaturedShopCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 110.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 110.h,
                  color: Colors.grey.shade200,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Expanded(
              child: Center(
                child: AppText(
                  text: title,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
