// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, unnecessary_null_comparison

import 'package:dressing_app/controller/cart_bottom_navbar_widget_controller/cart_bottom_navbar_widget_controller.dart';
import 'package:dressing_app/view/widget/cart_bottom_navbar_widget/widget/custom_card_view_widget_order_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomTapViewOrder extends StatelessWidget {
  const CustomTapViewOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartBottomNavBarWidgetControllerIMP>(
      init: CartBottomNavBarWidgetControllerIMP(),
      builder: (controller) => controller.isLoading == false
          ? CustomCardViewWidgetOrderShimmer()
          : controller.dataOrderRentModel == null
              ? Container(margin: EdgeInsets.symmetric(horizontal: 10.sp), alignment: Alignment.center, child: Text('noProd'.tr, style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center))
              : Container(
                  padding: EdgeInsets.only(top: 7.h),
                  margin: EdgeInsets.symmetric(horizontal: 5.sp),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
                  child: ListView.separated(
                    itemCount: controller.dataOrderRentModel.length,
                    separatorBuilder: (context, index) => SizedBox(height: 2.h),
                    itemBuilder: (context, index) => Stack(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp), color: Theme.of(context).colorScheme.error),
                            child: SizedBox(
                              width: Get.width,
                              height: 18.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('codeOrder'.tr, style: Theme.of(context).textTheme.bodyLarge),
                                          Text("( ${controller.dataOrderRentModel[index].orderRentID.toString()} )", style: Theme.of(context).textTheme.labelMedium),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('amount'.tr, style: Theme.of(context).textTheme.bodyLarge),
                                          Text("  ( ${controller.dataOrderRentModel[index].amount.toString()} )", style: Theme.of(context).textTheme.labelMedium),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('createat'.tr, style: Theme.of(context).textTheme.bodyMedium),
                                      Text(controller.dataOrderRentModel[index].createdAt!, style: Theme.of(context).textTheme.headlineMedium),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('updateat'.tr, style: Theme.of(context).textTheme.bodyMedium),
                                      Text(controller.dataOrderRentModel[index].updateAt!, style: Theme.of(context).textTheme.headlineMedium),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('endat'.tr, style: Theme.of(context).textTheme.bodyMedium),
                                      Text(controller.dataOrderRentModel[index].endAt!, style: Theme.of(context).textTheme.headlineMedium),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('priceat'.tr, style: Theme.of(context).textTheme.bodyLarge),
                                          Text("( ${controller.dataOrderRentModel[index].totalPrice.toString()} )", style: Theme.of(context).textTheme.labelMedium),
                                        ],
                                      ),
                                      Container(
                                        width: 20.w,
                                        height: 4.h,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).colorScheme.onPrimary,
                                          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(color: Theme.of(context).colorScheme.error.withOpacity(0.2), offset: const Offset(1.1, 1.1), blurRadius: 8.0),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            controller.dataOrderRentModel[index].payNow == 0 ? 'wait'.tr : 'accept'.tr,
                                            textAlign: TextAlign.center,
                                            style: controller.dataOrderRentModel[index].payNow == 0 ? Theme.of(context).textTheme.bodyMedium : Theme.of(context).textTheme.headlineMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
