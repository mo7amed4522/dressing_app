// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, must_be_immutable

import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:dressing_app/model/on_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormFild extends StatelessWidget {
  final String? hintText;
  final String? lable;
  final IconData? suffixIcon;
  final TextEditingController? mycontroller;
  final String? Function(String?) validator;
  final TextInputType? textInputType;
  bool? enabled = true;
  final bool? isShowText;
  final void Function()? sufficsIconTap;
  CustomTextFormFild({super.key, this.sufficsIconTap, this.isShowText, this.textInputType, required this.validator, this.mycontroller, this.hintText, this.lable, this.suffixIcon, this.enabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 4, right: 4),
      child: TextFormField(
        enabled: enabled,
        keyboardType: textInputType,
        obscureText: isShowText == null || isShowText == false ? false : true,
        validator: validator,
        style: Theme.of(context).textTheme.bodyMedium,
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14.0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          suffixIcon: InkWell(
              onTap: sufficsIconTap,
              child: Icon(
                suffixIcon,
                color: Theme.of(context).primaryColorLight,
              )),
          label: Container(margin: const EdgeInsets.symmetric(horizontal: 9), child: Text(lable!)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.ontap, required this.buttonName});

  final VoidCallback ontap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: Get.width / 1.3,
        height: Get.height / 15,
        decoration: ShapeDecoration(color: Theme.of(context).primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), shadows: [BoxShadow(color: Color(0x19C94210), blurRadius: 30, offset: Offset(0, 10), spreadRadius: 0)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              CupertinoIcons.flame_fill,
              size: 24.sp,
              color: Theme.of(context).textTheme.labelLarge!.color,
            ),
            Text(
              buttonName,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SvgPicture.asset(
              AppPhotoLink.cartFill,
              width: 3.w,
              height: 4.h,
              fit: BoxFit.fill,
              color: Theme.of(context).textTheme.labelLarge!.color,
            )
          ],
        ),
      ),
    );
  }
}

class ButtomLoginWidget extends StatelessWidget {
  const ButtomLoginWidget({super.key, required this.ontap, required this.buttonName});

  final VoidCallback ontap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: Get.width / 1.12,
        height: Get.height / 15,
        decoration: ShapeDecoration(
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadows: [BoxShadow(color: Color(0x19C94210), blurRadius: 30, offset: Offset(0, 10), spreadRadius: 0)],
        ),
        alignment: Alignment.center,
        child: Text(
          buttonName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}

class GradientWidget extends StatelessWidget {
  final Widget child;
  final Color? color1;
  final Color? color2;

  const GradientWidget({
    Key? key,
    required this.child,
    this.color1,
    this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          transform: GradientRotation(1),
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Theme.of(context).colorScheme.inversePrimary,
            Theme.of(context).colorScheme.onInverseSurface,
          ],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}

Widget boxPriceWidget(String text1, String txt2, context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5.sp),
    height: 10.h,
    width: 30.w,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimary,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      boxShadow: <BoxShadow>[
        BoxShadow(color: Theme.of(context).colorScheme.error.withOpacity(0.2), offset: const Offset(1.1, 1.1), blurRadius: 8.0),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text1, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium),
        Text(txt2, textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayLarge),
      ],
    ),
  );
}

class TopStoryLineWidget extends StatefulWidget {
  final List<Photos> images;
  final PageController pageController;

  const TopStoryLineWidget({Key? key, required this.images, required this.pageController}) : super(key: key);

  @override
  State<TopStoryLineWidget> createState() => _TopStoryLineWidgetState();
}

class _TopStoryLineWidgetState extends State<TopStoryLineWidget> {
  int currentPosition = 0;
  int lastCurrentPosition = 0;

  @override
  Widget build(BuildContext context) {
    widget.pageController.addListener(() {
      currentPosition = widget.pageController.page?.round() ?? 0;
      if (currentPosition != lastCurrentPosition) {
        if (mounted) {
          lastCurrentPosition = currentPosition;
          setState(() {});
        }
      }
    });
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 31),
      child: Row(
        children: List.generate(widget.images.length, (index) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 3),
              height: 2.7,
              width: (Get.width - 62) / widget.images.length,
              decoration: BoxDecoration(
                color: currentPosition == index ? Theme.of(context).primaryColorLight : Theme.of(context).colorScheme.onPrimaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }),
      ),
    );
  }
}
