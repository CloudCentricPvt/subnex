import 'package:flutter/material.dart';

import '../constants/k_colors.dart';

class KOutlinedCard extends StatelessWidget {
  final Icon icon;
  final String title;

  const KOutlinedCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.26,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: KColors.appPrimary),
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 1.3), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            icon,
            const SizedBox(
              height: 7,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w600,fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
