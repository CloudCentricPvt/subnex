import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sublet/utils/constants/k_colors.dart';
import 'package:sublet/views/opter_journey/send_feedback.dart';

import '../../utils/constants/k_sizes.dart';
import '../../utils/reusable_widgets/k_app_bar.dart';
import '../../utils/reusable_widgets/k_custom_app_bar.dart';
import '../../utils/reusable_widgets/k_elevated_card.dart';

class SubCategoryProductsScreen extends StatefulWidget {
  const SubCategoryProductsScreen({super.key});

  @override
  State<SubCategoryProductsScreen> createState() =>
      _SubCategoryProductsScreenState();
}

class _SubCategoryProductsScreenState extends State<SubCategoryProductsScreen> {
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
            const KCustomAppBar(screenTitle: "Microwaves"),
            const SizedBox(
              height: KSizes.spaceBtwItems_12,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => const SendFeedback());
                },
                child: KElevatedCard(
                  childWidget: _wSelectedSubCategoryItems(125,"assets/images/camera_img.png"),
                  cardHeight: 125,
                )),
            const SizedBox(
              height: KSizes.spaceBtwItems_12,
            ),
            KElevatedCard(
              childWidget: _wSelectedSubCategoryItems(125,"assets/images/device_img.png"),
              cardHeight: 125,
            ),
            const SizedBox(
              height: KSizes.spaceBtwItems_12,
            ),
            KElevatedCard(
              childWidget: _wSelectedSubCategoryItems(125,"assets/images/bike_img.png"),
              cardHeight: 125,
            )
          ],
        ),
      ),
    );
  }

  _wSelectedSubCategoryItems(double cardHeight, String imagePath) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Image.asset(
            imagePath,
            width: 100,
            height: cardHeight - 10,
            scale: 7,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 4.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hero Xtreme 125R",
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                          fontSize: 19.5),
                    ),
                    
                    GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(
                            msg: "Will be update soon.",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            textColor: Colors.white,
                            backgroundColor: Colors.black54,
                            fontSize: 16.0
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(Icons.edit,size: 18,color: KColors.appPrimary,),
                      ),
                    )
                  ],
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
                  height: KSizes.spaceBtwItems_08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        width: 70,
                        decoration: BoxDecoration(
                          border: Border.all(color: KColors.appPrimary),
                          borderRadius: BorderRadius.circular(4),
                          color: KColors.appPrimary,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 5.3), //(x,y)
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 3.0),
                          child: Center(
                              child: Text(
                            "Delist",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: KSizes.spaceBtwItems_08,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: KColors.appPrimaryGreen,
                            child: const SizedBox(
                              width: 14.0,
                              height: 14.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: KSizes.spaceBtwItems_08 - 2,),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Available",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                    fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
