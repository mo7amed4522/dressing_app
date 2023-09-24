import 'package:dressing_app/view/widget/shimmer_screen_widget/shimmer_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomCardCollectionShimmerWidget extends StatelessWidget {
  const CustomCardCollectionShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.sp),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (context, index) => SizedBox(height: 2.h),
        itemBuilder: (context, index) => Stack(
          children: [
            Container(
              width: Get.width,
              height: 17.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp), color: Theme.of(context).colorScheme.error),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 17.h,
                    width: 40.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp), bottomRight: Radius.circular(20.sp)),
                      child: ShimmerScreen.rectangular(
                        height: 17.h,
                        width: 10.w,
                        shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                        child: ShimmerScreen.rectangular(
                          height: 4.h,
                          width: 17.w,
                          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                        child: ShimmerScreen.rectangular(
                          height: 2.h,
                          width: Get.width / 2,
                          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                        ),
                      ),
                    ],
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
