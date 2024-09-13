import 'package:flutter/material.dart';

import '../constants/k_colors.dart';

class KInnerDepthCard extends StatelessWidget {
  final Icon icon;
  final String title;
  const KInnerDepthCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: KColors.appPrimaryIndigo,
            ),
            BoxShadow(
              color: Colors.white,
              spreadRadius: -0.1,
              blurRadius: 6,
              offset: Offset(3, 3),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            icon,
            const SizedBox(
              height: 12,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
