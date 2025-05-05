import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/constants/colors.dart';
import 'package:kubramarket_user/widgets/common/appbar_widget.dart';
import 'package:kubramarket_user/widgets/common/button_widget.dart';
import 'package:kubramarket_user/widgets/common/header_widget.dart';

import '../../widgets/common/textfield_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppbar(title: "", hasBackButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              HeaderWidget(title: "Profile"),
              SizedBox(height: 10.h),
              Center(
                child: CircleAvatar(
                  radius: 45.r,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(
                    Icons.person,
                    size: 60.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              CustomTextField(
                readOnly: false,
            label: "Name",
            controller: TextEditingController(text: "Mohammed Muzammil"),
            showIcon: true,
            onIconTap: () {
             
            },
          ),
          
            CustomTextField(
                readOnly: false,
            label: "E-mail",
            controller: TextEditingController(text: "mohammedmuzammil@gmail.com"),
            showIcon: true,
            onIconTap: () {
             
            },
          ),
          
            CustomTextField(
                readOnly: false,
            label: "Phone Number",
            controller: TextEditingController(text: "9360777674"),
            showIcon: true,
            onIconTap: () {
             
            },
          ),
          
            CustomTextField(
                readOnly: false,
            label: "Address",
            controller: TextEditingController(text: "Bangi shop, Ambur"),
            showIcon: true,
            onIconTap: () {
             
            },
          ),
          SizedBox(height: 30.h),
          
          NormalButton(text: "Save", color: AppColor.primary, fontSize: 15, onPressed: (){}, width: double.infinity,)
          
          
            ],
          ),
        ),
      ),
    );
  }
}