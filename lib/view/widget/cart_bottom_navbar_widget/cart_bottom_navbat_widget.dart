// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dressing_app/controller/cart_bottom_navbar_widget_controller/cart_bottom_navbar_widget_controller.dart';
import 'package:dressing_app/view/widget/cart_bottom_navbar_widget/widget/custom_card_view_widget_collection.dart';
import 'package:dressing_app/view/widget/cart_bottom_navbar_widget/widget/custom_card_view_widget_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBottomNavBarWidget extends StatelessWidget {
  const CartBottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartBottomNavBarWidgetControllerIMP>(
      init: CartBottomNavBarWidgetControllerIMP(),
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
                CustomTapViewOrder(),
                CustomTapViewCollection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
