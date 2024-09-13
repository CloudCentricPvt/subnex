import 'package:flutter/material.dart';

import '../constants/k_colors.dart';
import '../validators/k_validation.dart';

class KTextInput extends StatelessWidget {
  const KTextInput({
    super.key,
    required this.inputController,
    required this.hint,
    required this.textError,
  });

  final TextEditingController inputController;
  final String hint;
  final String textError;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: Colors.black),
      controller: inputController,
      keyboardType: TextInputType.text,
      // Notice the const here right?
      // So the idea is that decoration objects could rebuild to either change one thing or the other, so 'label' here cannot be a constant
      // So to solve this InputDecoration should not have const.
      decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          //prefixIcon: Icon(Icons.phone),
          labelText: hint,
          labelStyle: const TextStyle(
              color: KColors.appSecondaryGrey, fontWeight: FontWeight.w400)),
      validator: (hint) {
        return KValidator.requiredField(hint, textError);
      },
    );
  }
}
