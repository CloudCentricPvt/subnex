import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subnex/utils/constants/k_sizes.dart';
import 'package:subnex/utils/reusable_widgets/k_app_bar.dart';
import 'package:subnex/utils/reusable_widgets/k_custom_app_bar.dart';
import 'package:subnex/views/opter_journey/send_feedback.dart';
import '../../utils/reusable_widgets/k_elevated_card.dart';

class OptedProductsScreen extends StatefulWidget {
  const OptedProductsScreen({super.key});

  @override
  State<OptedProductsScreen> createState() => _OptedProductsScreenState();
}

class _OptedProductsScreenState extends State<OptedProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const KAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          children: [
            const KCustomAppBar(screenTitle: "Opted Products"),
            const SizedBox(
              height: KSizes.spaceBtwItems_12,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => const SendFeedback());
                },
                child: KElevatedCard(
                  childWidget: _wSentRequestItems(150),
                  cardHeight: 150,
                )),
            const SizedBox(
              height: KSizes.spaceBtwItems_12,
            ),
            KElevatedCard(
              childWidget: _wSentRequestItems(150),
              cardHeight: 150,
            ),
            const SizedBox(
              height: KSizes.spaceBtwItems_12,
            ),
            KElevatedCard(
              childWidget: _wSentRequestItems(150),
              cardHeight: 150,
            )
          ],
        ),
      ),
    );
  }

  _wSentRequestItems(double cardHeight) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Image.asset(
            "assets/images/bike_img.png",
            width: 100,
            height: cardHeight - 10,
            scale: 7,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hero Xtreme 125R",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                      fontSize: 19.5),
                ),
                const SizedBox(
                  height: KSizes.spaceBtwItems_08 / 2,
                ),
                Flexible(
                  child: Text(
                    "The Hero Xtreme 125R has an aggressive streetfighter design language with its LED headlamp nestled between razor sharp tank extensions, split seat setup, stubby exhaust and fat 150mm rear tyre. Drawing power from a 125cc single cylinder air-cooled engine paired with a 5-speed gearbox, performance is a crisp 11.5bhp with low down torque for rapid acceleration.",
                    maxLines: 3,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade700,
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
                const SizedBox(
                  height: KSizes.spaceBtwItems_08 / 2,
                ),
                Row(
                  children: [
                    Text(
                      "Opted On: ",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      width: KSizes.spaceBtwItems_08,
                    ),
                    Text(
                      "Aug 28, 2024",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(
                  height: KSizes.spaceBtwItems_08 / 2,
                ),
                Flexible(
                  child: Text(
                    "How was your experience with this Product?",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

}
