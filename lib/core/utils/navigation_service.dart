import 'package:flutter/material.dart';

class NavigationService {
  static Future push(BuildContext context, Widget page) {
    return Navigator.push(context, _animatedRoute(page));
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static Future pushReplacement(BuildContext context, Widget page) {
    return Navigator.pushReplacement(context, _animatedRoute(page));
  }

  static PageRouteBuilder _animatedRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeInOut));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
