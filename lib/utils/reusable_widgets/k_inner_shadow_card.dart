import 'package:flutter/material.dart';

class KInnerShadowCard extends StatelessWidget {
  const KInnerShadowCard({super.key, this.childWidget, this.cardHeight});
  final Widget? childWidget;
  final double? cardHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: cardHeight != null && cardHeight != 0.0 ? cardHeight : 130,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Colors.black.withOpacity(0.10),
          //     Colors.transparent,
          //     Colors.transparent,
          //     Colors.black.withOpacity(0.0),
          //   ],
          //   stops: const [0.0, 0.0, 0.0, 0.0],
          // ),
          boxShadow:  [
            /// ---  OutSide -> top and left shadow
            BoxShadow(
              color: Colors.grey.shade400,
              // spreadRadius: 2.0,
              // blurRadius: 4.0,
                offset: const Offset(0, 0)
            ),
            /// --- InSide -> top and left shadow
            const BoxShadow(
              color: Colors.white,
              spreadRadius: -2.0,
              blurRadius: 1.0,
              offset: Offset(0.5, 0.5), /// --- for shadow spreading (solid or normal)
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0,bottom: 4.0,left: 6,right: 4),
          child: childWidget!,
        ),
      ),
    );
  }
}
