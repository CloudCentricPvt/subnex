import 'package:flutter/material.dart';

import '../constants/k_colors.dart';

class KTextInputFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? initValue;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final bool? readOnly;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final int? maxLines;

  const KTextInputFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.initValue,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChange,
    this.readOnly,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: Colors.black),
      initialValue: initValue,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      maxLines: maxLines,
      validator: validator,
      onChanged: onChange,
      readOnly: readOnly!,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: KColors.appSecondaryGrey, fontWeight: FontWeight.w400),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: KColors.appSecondaryGrey, fontWeight: FontWeight.w400),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
    );
  }
}
