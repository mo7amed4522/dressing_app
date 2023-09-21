// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomCardProductWidget extends StatelessWidget {
  final VoidCallback onProductBtn;
  final String photoImage;
  final String prodName;

  const CustomCardProductWidget({
    super.key,
    required this.onProductBtn,
    required this.photoImage,
    required this.prodName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onProductBtn,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 4.sp,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.sp),
                child: Image.network(
                  photoImage,
                  height: 20.h,
                  width: Get.width,
                  fit: BoxFit.cover,
                  errorBuilder: (context, object, s) => Image.asset(
                    AppPhotoLink.logo,
                    height: 20.h,
                    width: 37.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:
                  Text(prodName, style: Theme.of(context).textTheme.bodyMedium),
            ),
            /* Positioned(
              top: 16.h,
              right: 0.3.w,
              child: LikUnLikBtnWidgetAnimation(
                onLikeBtnTap: onLikeUnlikBtn,
                like: like,
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
