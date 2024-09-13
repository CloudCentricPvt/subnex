import 'package:flutter/material.dart';

import '../../utils/constants/k_images.dart';

class CountryCodePicker extends StatelessWidget {
  const CountryCodePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: DropdownButton<String>(
          onChanged: null, // Non Clickable
          value: 'IN',
          items: [
            DropdownMenuItem(
              enabled: false,
              value: 'IN',
              child: Row(
                children: [
                  Image.asset(
                    KImageStrings.indian_flag_icon, // Add your flag image asset
                    width: 20,
                  ),
                  //const SizedBox(width: 5),
                  //Text('+91', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            // Add more country codes here
          ],
        ),
      ),
    );
  }
}
