import 'package:dressing_app/controller/product_screen_controller/product_screen_controller.dart';
import 'package:dressing_app/core/constants/companent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikUnLikBtnWidgetAnimation extends StatelessWidget {
  final VoidCallback onLikeBtnTap;
  final bool like;
  const LikUnLikBtnWidgetAnimation(
      {super.key, required this.like, required this.onLikeBtnTap});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductScreenControllerIMP>(
      init: ProductScreenControllerIMP(),
      builder: (controller) => InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          onLikeBtnTap();
          controller.controllerAnimation
              .reverse()
              .then((value) => controller.controllerAnimation.forward());
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.error.withOpacity(0.30),
          ),
          child: Center(
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.only(top: 3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.60),
              ),
              child: like
                  ? ScaleTransition(
                      scale: Tween(begin: 0.7, end: 1.0).animate(
                          CurvedAnimation(
                              parent: controller.controllerAnimation,
                              curve: Curves.easeOut)),
                      child: GradientWidget(
                        child: Icon(
                          CupertinoIcons.heart_solid,
                          color: Theme.of(context).colorScheme.onBackground,
                          size: 30,
                        ),
                      ),
                    )
                  : ScaleTransition(
                      scale: Tween(begin: 0.7, end: 1.0).animate(
                          CurvedAnimation(
                              parent: controller.controllerAnimation,
                              curve: Curves.easeOut)),
                      child: Icon(
                        CupertinoIcons.heart_solid,
                        color: Theme.of(context).colorScheme.onBackground,
                        size: 30,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
