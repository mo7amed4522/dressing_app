// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dressing_app/controller/make_order_screen_controller/make_order_screen_controller.dart';
import 'package:dressing_app/core/constants/companent.dart';
import 'package:dressing_app/view/widget/make_order_widget/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MakeOrderScreen extends StatelessWidget {
  const MakeOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MakeOrderScreenControllerIMP>(
        init: MakeOrderScreenControllerIMP(),
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6.h),
            Stack(
              children: [
                Align(alignment: Alignment.topRight, child: IconButton(icon: Icon(Icons.arrow_back_ios_new), onPressed: controller.goBack, color: Theme.of(context).primaryColor)),
                Align(alignment: Alignment.center, child: Text('order'.tr, style: Theme.of(context).textTheme.labelMedium)),
              ],
            ),
            SizedBox(height: 1.h),
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: Get.height - 10.h),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        SizedBox(height: 2.h),
                        Center(child: Container(width: Get.width - 10.w, alignment: Alignment.center, child: Text('confOrder'.tr, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center))),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.sp),
                              width: Get.width / 2 - 20.sp,
                              child: TextFieldWidgetOrder(
                                hintText: 'amount1'.tr,
                                onChanged: (value) {
                                  if (value == '') {
                                  } else {
                                    controller.calculatePrice(int.parse(value));
                                  }
                                },
                                textInputType: TextInputType.phone,
                                errorText: controller.amountError,
                                enabled: true,
                                textEditingController: controller.amountController,
                                focusNode: controller.amountFocusNode,
                                callback: () {},
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.sp),
                              width: Get.width / 2 - 20.sp,
                              child: TextFieldWidgetOrder(
                                hintText: 'price'.tr,
                                onChanged: (valu) {},
                                errorText: controller.priceErro,
                                enabled: false,
                                textEditingController: controller.priceController,
                                focusNode: controller.priceFocusNode,
                                callback: () {},
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.sp),
                          child: TextFieldWidgetOrder(
                            hintText: 'date1'.tr,
                            errorText: controller.date1Error,
                            onChanged: (valu) {},
                            textInputType: TextInputType.none,
                            enabled: true,
                            textEditingController: controller.date1Controller,
                            focusNode: controller.date1FocusNode,
                            suffixIcon: CupertinoIcons.calendar_today,
                            callback: () {
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      height: 20.h,
                                      width: Get.width,
                                      child: CupertinoDatePicker(
                                        backgroundColor: Theme.of(context).primaryColor,
                                        initialDateTime: DateTime.now(),
                                        minimumDate: DateTime.parse('1000-12-23'),
                                        maximumDate: DateTime.parse('3050-12-10'),
                                        onDateTimeChanged: (value) {
                                          controller.date1Controller.text = value.toString();
                                        },
                                        use24hFormat: false,
                                        showDayOfWeek: false,
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                          child: TextFieldWidgetOrder(
                            hintText: 'date2'.tr,
                            errorText: controller.date2Error,
                            onChanged: (valu) {},
                            enabled: true,
                            textEditingController: controller.date2Controller,
                            focusNode: controller.date2FocusNode,
                            textInputType: TextInputType.none,
                            suffixIcon: CupertinoIcons.calendar_today,
                            callback: () {
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      height: 20.h,
                                      width: Get.width,
                                      child: CupertinoDatePicker(
                                        backgroundColor: Theme.of(context).primaryColor,
                                        initialDateTime: DateTime.now(),
                                        minimumDate: DateTime.parse('1000-12-23'),
                                        maximumDate: DateTime.parse('3050-12-10'),
                                        onDateTimeChanged: (value) {
                                          controller.date2Controller.text = value.toString();
                                        },
                                        use24hFormat: false,
                                        showDayOfWeek: false,
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.sp),
                          alignment: Alignment.centerRight,
                          child: Text('phone1'.tr, style: Theme.of(context).textTheme.headlineMedium),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                          child: TextFieldWidgetOrder(
                            hintText: 'Phone'.tr,
                            errorText: controller.phoneErro,
                            onChanged: (valu) {},
                            enabled: false,
                            textEditingController: TextEditingController(text: '01020504710'),
                            focusNode: FocusNode(),
                            suffixIcon: CupertinoIcons.phone,
                            callback: () {},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.sp),
                          alignment: Alignment.centerRight,
                          child: Text('phone2'.tr, style: Theme.of(context).textTheme.headlineMedium),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                          child: TextFieldWidgetOrder(
                            hintText: 'phone2'.tr,
                            errorText: controller.confirmError,
                            onChanged: (valu) {},
                            enabled: controller.isExist,
                            textEditingController: controller.confirmPhoneController,
                            focusNode: controller.confirmFocusNode,
                            suffixIcon: CupertinoIcons.phone,
                            callback: () {},
                          ),
                        ),
                        Visibility(
                          visible: controller.isExist,
                          child: InkWell(
                            onTap: controller.onUpdateClick,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                              width: 40.w,
                              height: 6.h,
                              decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(20.sp)),
                              child: Center(child: Text('update'.tr, style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center)),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(bottom: 6.h),
                          alignment: Alignment.bottomCenter,
                          child: CustomButton(
                            ontap: controller.onOrderClick,
                            buttonName: "order".tr,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
