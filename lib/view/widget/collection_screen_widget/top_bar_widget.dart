import 'package:dressing_app/controller/collecrion_screen_controller/collection_screen_controller.dart';
import 'package:dressing_app/view/widget/collection_screen_widget/custom_visiabilty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TopBarWidgetProductCollection extends GetView<CollectionScreenControllerIMP> {
  const TopBarWidgetProductCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7.sp, vertical: 4.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(visible: controller.dataCollectionList!.nameProduct1 == null ? false : true, child: CustomVisibiltyWidget(productName: controller.dataCollectionList!.nameProduct1 ?? '')),
              Visibility(visible: controller.dataCollectionList!.nameProduct2 == null ? false : true, child: CustomVisibiltyWidget(productName: controller.dataCollectionList!.nameProduct2 ?? '')),
              Visibility(visible: controller.dataCollectionList!.nameProduct3 == null ? false : true, child: CustomVisibiltyWidget(productName: controller.dataCollectionList!.nameProduct3 ?? '')),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(visible: controller.dataCollectionList!.nameProduct4 == null ? false : true, child: CustomVisibiltyWidget(productName: controller.dataCollectionList!.nameProduct4 ?? '')),
              Visibility(visible: controller.dataCollectionList!.nameProduct5 == null ? false : true, child: CustomVisibiltyWidget(productName: controller.dataCollectionList!.nameProduct5 ?? '')),
              Visibility(visible: controller.dataCollectionList!.nameProduct6 == null ? false : true, child: CustomVisibiltyWidget(productName: controller.dataCollectionList!.nameProduct6 ?? '')),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(visible: controller.dataCollectionList!.nameProduct7 == null ? false : true, child: CustomVisibiltyWidget(productName: controller.dataCollectionList!.nameProduct7 ?? '')),
              Visibility(visible: controller.dataCollectionList!.nameProduct8 == null ? false : true, child: CustomVisibiltyWidget(productName: controller.dataCollectionList!.nameProduct8 ?? '')),
              Visibility(visible: controller.dataCollectionList!.nameProduct9 == null ? false : true, child: CustomVisibiltyWidget(productName: controller.dataCollectionList!.nameProduct9 ?? '')),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(visible: controller.dataCollectionList!.nameProduct10 == null ? false : true, child: CustomVisibiltyWidget(productName: controller.dataCollectionList!.nameProduct10 ?? '')),
            ],
          ),
        ],
      ),
    );
  }
}
