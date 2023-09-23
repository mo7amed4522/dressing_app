// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dressing_app/view/widget/shimmer_screen_widget/shimmer_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CustomCardShimmerWidget extends StatelessWidget {
  const CustomCardShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27.h,
      margin: EdgeInsets.symmetric(horizontal: 4.sp),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp), color: Theme.of(context).colorScheme.tertiaryContainer),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.sp),
              child: ShimmerScreen.rectangular(
                height: 20.h,
                shapeBorder: RoundedRectangleBorder(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.surfaceVariant,
              highlightColor: Theme.of(context).colorScheme.onSurfaceVariant,
              child: Text(
                'loading'.tr,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
