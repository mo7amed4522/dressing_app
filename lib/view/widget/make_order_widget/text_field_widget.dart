// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextFieldWidgetOrder extends StatelessWidget {
  final String hintText;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final IconData? suffixIcon;
  final String errorText;
  final bool? enabled;
  final VoidCallback callback;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  const TextFieldWidgetOrder({
    super.key,
    this.enabled,
    required this.hintText,
    this.onChanged,
    required this.errorText,
    this.textInputType,
    required this.focusNode,
    required this.textEditingController,
    this.suffixIcon,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary)),
        hintStyle: TextStyle(fontSize: 14.0),
        enabled: enabled!,
        errorText: errorText,
        errorStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        suffixIcon: Icon(suffixIcon, color: Theme.of(context).primaryColorLight),
      ),
      focusNode: focusNode,
      onChanged: onChanged,
      onTap: callback,
      keyboardType: textInputType,
      controller: textEditingController,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
