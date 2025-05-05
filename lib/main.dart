import 'package:flutter/material.dart';
import 'package:kubramarket_user/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'providers/bottomnav_provider.dart';
import 'providers/shopcategory_provider.dart';
import 'views/splash/splash_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
         ChangeNotifierProvider(create: (_) => ShopCategoryProvider()),
         ChangeNotifierProvider(create: (_) => AuthProvider()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        theme: ThemeData( 
          scaffoldBackgroundColor: AppColor.white,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
          debugShowCheckedModeBanner: false,
          title: 'Kubra Market',
          // home: BottomNavScreen(),
          home: SplashScreen(),
          ),
      designSize: const Size(412, 917),
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }
}