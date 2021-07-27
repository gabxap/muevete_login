import 'package:flutter/material.dart';
import 'package:muevete/generated/gen_colors.g.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 100.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: EasyColors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Helvetica',
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }
}
