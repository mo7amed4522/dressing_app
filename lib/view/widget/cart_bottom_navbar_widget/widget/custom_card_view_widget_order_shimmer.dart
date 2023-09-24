// ignore_for_file: prefer_const_constructors

import 'package:dressing_app/view/widget/shimmer_screen_widget/shimmer_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CustomCardViewWidgetOrderShimmer extends StatelessWidget {
  const CustomCardViewWidgetOrderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7.h),
      margin: EdgeInsets.symmetric(horizontal: 5.sp),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (context, index) => SizedBox(height: 2.h),
        itemBuilder: (context, index) => Stack(
          children: [
            Container(
              width: Get.width,
              height: 18.h,
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp), color: Theme.of(context).colorScheme.error),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Theme.of(context).colorScheme.surfaceVariant,
                            highlightColor: Theme.of(context).colorScheme.onSurfaceVariant,
                            child: Text('loading'.tr, style: Theme.of(context).textTheme.bodySmall),
                          ),
                          ShimmerScreen.rectangular(
                            height: 3.h,
                            width: 20.w,
                            shapeBorder: RoundedRectangleBorder(),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Theme.of(context).colorScheme.surfaceVariant,
                            highlightColor: Theme.of(context).colorScheme.onSurfaceVariant,
                            child: Text('loading'.tr, style: Theme.of(context).textTheme.bodySmall),
                          ),
                          ShimmerScreen.rectangular(
                            height: 3.h,
                            width: 30.w,
                            shapeBorder: RoundedRectangleBorder(),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Theme.of(context).colorScheme.surfaceVariant,
                        highlightColor: Theme.of(context).colorScheme.onSurfaceVariant,
                        child: Text('loading'.tr, style: Theme.of(context).textTheme.bodySmall),
                      ),
                      ShimmerScreen.rectangular(
                        height: 3.h,
                        width: Get.width - 80.sp,
                        shapeBorder: RoundedRectangleBorder(),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Theme.of(context).colorScheme.surfaceVariant,
                        highlightColor: Theme.of(context).colorScheme.onSurfaceVariant,
                        child: Text('loading'.tr, style: Theme.of(context).textTheme.bodySmall),
                      ),
                      ShimmerScreen.rectangular(
                        height: 3.h,
                        width: Get.width - 80.sp,
                        shapeBorder: RoundedRectangleBorder(),
                      )
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Container(
                    width: Get.width,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(color: Theme.of(context).colorScheme.error.withOpacity(0.2), offset: const Offset(1.1, 1.1), blurRadius: 8.0),
                      ],
                    ),
                    child: ShimmerScreen.rectangular(
                      height: 4.h,
                      width: Get.width,
                      shapeBorder: RoundedRectangleBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
