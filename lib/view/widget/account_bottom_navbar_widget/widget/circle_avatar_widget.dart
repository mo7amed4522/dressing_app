import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.sp),
      child: Image.asset(
        AppPhotoLink.avatar,
        fit: BoxFit.contain,
        width: 80.w,
        height: 27.h,
      ),
    );
  }
}
