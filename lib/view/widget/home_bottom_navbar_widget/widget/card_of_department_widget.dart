// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CardOfDepartmentWidget extends StatelessWidget {
  final String photoImage;
  final String dep_name;
  final VoidCallback onDepTap;
  const CardOfDepartmentWidget({super.key, required this.photoImage, required this.dep_name, required this.onDepTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDepTap,
      child: Container(
        height: 23.h,
        width: 37.w,
        decoration: BoxDecoration(color: Theme.of(context).cardTheme.color, borderRadius: BorderRadius.circular(10.sp)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.sp),
              child: Image.network(
                photoImage,
                height: 17.h,
                width: 37.w,
                fit: BoxFit.cover,
                errorBuilder: (context, object, stactrack) => Image.asset(
                  AppPhotoLink.logo,
                  fit: BoxFit.contain,
                  height: 17.h,
                  width: 37.w,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(dep_name, style: Theme.of(context).textTheme.bodyLarge),
            )
          ],
        ),
      ),
    );
  }
}
