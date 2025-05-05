import 'package:flutter/material.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  const HeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppText(text: title, fontSize: 20, fontWeight: FontWeight.w500);
  }
}