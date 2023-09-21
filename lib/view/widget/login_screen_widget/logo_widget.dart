import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LogoImageWidget extends StatelessWidget {
  const LogoImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.sp),
        child: Image.asset(
          AppPhotoLink.logo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
