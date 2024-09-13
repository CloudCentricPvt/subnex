import 'package:flutter/material.dart';
import 'package:subnex/utils/constants/k_colors.dart';
import 'package:subnex/utils/constants/k_sizes.dart';

import '../../utils/reusable_widgets/k_inner_shadow_card.dart';

class ListerMode extends StatefulWidget {
  const ListerMode({super.key});

  @override
  State<ListerMode> createState() => _ListerModeState();
}

class _ListerModeState extends State<ListerMode> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///---  My Listed Products
          _wMyProducts(),
        ],
      ),
    );
  }

  Widget _wMyProducts() {
    return KInnerShadowCard(childWidget: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: KColors.appPrimaryIndigo,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image.asset(
              "assets/images/bike_img.png",
              width: 104,
              height: 114,
              scale: 7,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Apple iPhone 15 Pro,128GB,\nNatural Titanium",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: KColors.appPrimary),
              ),
              const SizedBox(
                height: KSizes.spaceBtwItems_08 / 2,
              ),
              SizedBox(
                width: 220,
                // Set width according to your layout requirements
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "29 Aug, 2024",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: ColoredBox(
                          color: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 12),
                            child: Text("Delist",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color:
                                    Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: KSizes.spaceBtwItems_08 / 2,
              ),
              SizedBox(
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$200 / Week",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: ColoredBox(
                        color: Colors.grey.shade100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
                          child: Text("Active",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color:
                                  KColors.appPrimaryGreen)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

}
