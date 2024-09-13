import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../reusable_widgets/k_custom_app_bar.dart';

class KSquareOutlineShimmer extends StatelessWidget {
  final String screenTitle;
  const KSquareOutlineShimmer({super.key, required this.screenTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KCustomAppBar(screenTitle: screenTitle),
          const SizedBox(
            height: 12,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            //period: Duration(milliseconds: 1500),
            //direction: ShimmerDirection.ltr,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 15, // Placeholder item count
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 20),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}