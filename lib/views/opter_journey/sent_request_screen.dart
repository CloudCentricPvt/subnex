import 'package:flutter/material.dart';
import 'package:sublet/utils/constants/k_sizes.dart';
import 'package:sublet/utils/reusable_widgets/k_app_bar.dart';
import 'package:sublet/utils/reusable_widgets/k_custom_app_bar.dart';
import '../../utils/reusable_widgets/k_elevated_card.dart';
import '../home/home_screen.dart';

class SentRequestScreen extends StatefulWidget {
  const SentRequestScreen({super.key});

  @override
  State<SentRequestScreen> createState() => _SentRequestScreenState();
}

class _SentRequestScreenState extends State<SentRequestScreen> {

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
            const KCustomAppBar(screenTitle: "Sent Requests"),
            const SizedBox(height: KSizes.spaceBtwItems_12,),
            KElevatedCard(childWidget: _wSentRequestItems(170), cardHeight: 170,),
            const SizedBox(height: KSizes.spaceBtwItems_12,),
            KElevatedCard(childWidget: _wSentRequestItems(170), cardHeight: 170,),
            const SizedBox(height: KSizes.spaceBtwItems_12,),
            KElevatedCard(childWidget: _wSentRequestItems(170), cardHeight: 170,)
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
            padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4.0,bottom: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Apple iPhone 15 Pro, 128GB, Natural Titanium",
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
                    "Apple iPhone 15 Pro,128GB, 15 Pro Natural Titanium Apple iPhone 15 Pro,128GB, Natural Titanium",
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

                Text(
                  "Interest Sent",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                      fontSize: 20),
                ),

                const SizedBox(
                  height: KSizes.spaceBtwItems_08 / 2,
                ),

                Flexible(
                  child: Text(
                    "You will able to see contact details once your request got approved.",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.redAccent,
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
