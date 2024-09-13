import 'package:flutter/material.dart';

class KElevatedCard extends StatelessWidget {
  const KElevatedCard({super.key, this.childWidget, this.cardHeight});

  final Widget? childWidget;
  final double? cardHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: cardHeight != null && cardHeight != 0.0 ? cardHeight : 130,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            /// ---  OutSide -> top and left shadow ---> offset: const Offset(-3, -3)
            /// ---  OutSide -> bottom and right shadow ---> offset: const Offset(3, 3)
            BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 2.0,
                blurRadius: 8.0,
                offset: const Offset(3, 3)),

            /// --- InSide -> top and left shadow
            const BoxShadow(
              color: Colors.white70,
              //spreadRadius: 2.0,
              //blurRadius: 1.0,
              offset: Offset(-1, -1),/// --- for shadow spreading (solid or normal)
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 6, right: 4),
          child: childWidget!,
        ),
      ),
    );
  }
}
