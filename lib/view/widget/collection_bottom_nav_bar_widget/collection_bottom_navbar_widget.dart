// ignore_for_file: prefer_const_constructors

import 'package:dressing_app/controller/collection_bottom_navbar_widget_controller/collection_bottom_navbar_widget_controller.dart';
import 'package:dressing_app/view/widget/collection_bottom_nav_bar_widget/widget/custom_card_collection.dart';
import 'package:dressing_app/view/widget/collection_bottom_nav_bar_widget/widget/custom_card_collection_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionBottomNavBarWidget extends StatelessWidget {
  const CollectionBottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollextionBottomNavBarWidgetControllerIMP>(
      init: CollextionBottomNavBarWidgetControllerIMP(),
      builder: (controller) => controller.isLoading == false
          ? CustomCardCollectionShimmerWidget()
          : controller.collectionDataModelList == null
              ? Center(
                  child: Text(
                    'nodata'.tr,
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                )
              : CutomCardCollectionWidget(),
    );
  }
}
