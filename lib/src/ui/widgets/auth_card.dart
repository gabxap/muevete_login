import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

class AuthCard extends HookWidget {
  final Widget? child;
  final bool? forLogin;

  const AuthCard({Key? key, this.child, required this.forLogin})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: (forLogin!) ? 65.h : 75.h,
      width: 100.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: child,
      ),
    );
  }
}
