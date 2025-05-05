import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/constants/colors.dart';
import 'package:kubramarket_user/core/constants/images.dart';
import 'package:kubramarket_user/core/utils/navigation_service.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';
import 'package:kubramarket_user/widgets/common/button_widget.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/common/textfield_widget.dart';
import '../navigation/bottom_nav.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFE3CCDA),
      body: SafeArea(
        child: Stack(
          children: [
            // Background Left Image
            Positioned(
              top: 120.h,
              right: 
              authProvider.isLoginPage ? 0 : null,
              left: authProvider.isLoginPage ? null : 0,
              child: Image.asset(
                authProvider.isLoginPage ?
                "assets/right.png" : "assets/left.png",
                width: 200.w,
              ),
            ),

            // Logo
            Positioned(
              top: 20.h,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  AppAsset.logo,
                  width: 220.w,
                ),
              ),
            ),

            // Login Container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 
                !authProvider.isLoginPage ? 650.h :
                550.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50.r)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 
                      authProvider.isLoginPage ? "Log In" :
                      "Sign Up",
                      fontSize: 30,
                      color: AppColor.primary,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 30.h),
                    if(!authProvider.isLoginPage)
                    CustomTextField(
                      label: "Name",
                      controller: TextEditingController(),
                    ),
                    if(!authProvider.isLoginPage)
                    CustomTextField(
                      label: "Phone",
                      controller: TextEditingController(),
                    ),
                    CustomTextField(
                      label: "E-mail",
                      controller: TextEditingController(),
                    ),
                 
                    CustomTextField(
                      label: "Password",
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20.h),
                    NormalButton(text:
                    authProvider.isLoginPage ?
                     "Log In" : "Sign Up", color: AppColor.primary, fontSize: 18, onPressed: (){
                      NavigationService.pushReplacement(context, BottomNavScreen());
                     },
                    width: double.infinity, height: 45.h,),
                    
                    SizedBox(height: 16.h),
                    if(authProvider.isLoginPage)
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: 
                        AppText(text: "Forget password?", color: AppColor.primary, fontWeight: FontWeight.bold,)
                     
                      ),
                    ),
                    SizedBox(height: 10.h,),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          authProvider.toggleLogin();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              text: 
                              authProvider.isLoginPage ?
                              "Don't have an Account? " :
                              "Already have an Account? ",
                              style: TextStyle(color: Colors.grey.shade700),
                              children: [
                                TextSpan(
                                  text: 
                                   !authProvider.isLoginPage ?
                                  "Log In" : "Sign Up",
                                  style: TextStyle(
                                    color: const Color(0xFF9A3C7E),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
