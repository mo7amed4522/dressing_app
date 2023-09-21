// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomVisibiltyWidget extends StatelessWidget {
  String? productName;
  CustomVisibiltyWidget({super.key, this.productName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 30.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16.sp),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Theme.of(context).colorScheme.error.withOpacity(0.2), offset: const Offset(1.1, 1.1), blurRadius: 8.0),
        ],
      ),
      child: Center(child: Text(productName ?? '', style: Theme.of(context).textTheme.bodyMedium)),
    );
  }
}
