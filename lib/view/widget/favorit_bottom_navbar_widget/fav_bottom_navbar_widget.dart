// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dressing_app/controller/favoriet_bottom_navbar_widget_controller/favoriet_bottom_navbar_widget_controller.dart';
import 'package:dressing_app/view/widget/favorit_bottom_navbar_widget/widget/custom_card_view_widget.dart';
import 'package:dressing_app/view/widget/favorit_bottom_navbar_widget/widget/cuustom_card_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavriteBottmNavBarWidget extends StatelessWidget {
  const FavriteBottmNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavorietBottomNvaBarWidgetControllerIMP>(
      init: FavorietBottomNvaBarWidgetControllerIMP(),
      builder: (controller) => Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: TabBar(
              labelColor: Theme.of(context).tabBarTheme.labelColor,
              unselectedLabelColor: Theme.of(context).tabBarTheme.unselectedLabelColor,
              dividerColor: Theme.of(context).tabBarTheme.dividerColor,
              indicatorSize: TabBarIndicatorSize.tab,
              controller: controller.tabController,
              labelStyle: Theme.of(context).tabBarTheme.labelStyle,
              unselectedLabelStyle: Theme.of(context).tabBarTheme.unselectedLabelStyle,
              tabs: [Tab(text: 'prod'.tr), Tab(text: 'coll'.tr)],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TabBarView(
              controller: controller.tabController,
              children: [
                CustomCardLoveViewWidget(),
                CustomCardLoveViewCollectionWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
