import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sublet/utils/reusable_widgets/k_elevated_card.dart';

import '../../utils/constants/k_sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/reusable_widgets/k_app_bar.dart';
import '../../utils/reusable_widgets/k_custom_app_bar.dart';

class SendFeedback extends StatefulWidget {
  const SendFeedback({super.key});

  @override
  State<SendFeedback> createState() => _SendFeedbackState();
}

class _SendFeedbackState extends State<SendFeedback> {

  final _feedbackController  =  TextEditingController();
  late double? _feedbackRating;

  @override
  void initState() {
    _feedbackRating = 0.0;
    super.initState();
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const KCustomAppBar(screenTitle: "Send your feedback"),
            const SizedBox(
              height: KSizes.spaceBtwItems_12,
            ),
            KElevatedCard(
                childWidget: _wSentRequestItems(115), cardHeight: 115),
            const SizedBox(
              height: KSizes.spaceBtwItems_24,
            ),

            Text("Tell us your honest feedback to help us improve",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),

            const SizedBox(
              height: KSizes.spaceBtwItems_24 * 1.5,
            ),

            _wEdtSendFeedback(  _feedbackController),

            const SizedBox(
              height: KSizes.spaceBtwItems_24 * 1.5,
            ),

            _wRateUsStar(),
            const SizedBox(
              height: KSizes.spaceBtwItems_24 * 1.5,
            ),

            _wBtnSendFeedback()

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
              ],
            ),
          ),
        ),
      ],
    );
  }

  _wEdtSendFeedback(TextEditingController feedbackController){
    return TextFormField(
      controller: _feedbackController,
      maxLines: 8,
      maxLength: 600,
      cursorColor: Colors.blueAccent,
      textAlign: TextAlign.start,
      onTapOutside: (event) =>
      {FocusManager.instance.primaryFocus?.unfocus()},
      decoration: InputDecoration(
        isDense: true,
        alignLabelWithHint: true,
        hintText: "Enter your feedback",
        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w400),
        labelText: "Enter your feedback",
        labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w400),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black54,
              width: 2.0), // Custom border when focused
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black,
              width: 1.0), // Custom border when enabled but not focused
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0)),
        // Adds an outline border
        floatingLabelBehavior: FloatingLabelBehavior.never, // Prevents the label from shrinking
      ),
    );
  }

  _wRateUsStar(){
    return Center(
      child: RatingBar.builder(
        initialRating: 0,  // Set initial rating
        minRating: 1,      // Minimum rating allowed
        direction: Axis.horizontal,  // Rating bar direction
        allowHalfRating: true,  // Allow half ratings
        itemCount: 5,  // Number of stars
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),  // Padding between stars
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,  // Color of the stars
        ),
        onRatingUpdate: (rating) {
          _feedbackRating = rating;
        },
      ),
    );
    //return CustomStarRating();
  }

  _wBtnSendFeedback(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: SizedBox(
        width: KHelperFunctions.screenWidth() * 0.92,
        child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.blueAccent,
            side: const BorderSide(color: Colors.blueAccent),
          ),
          onPressed: () {
           if(_feedbackController.text.isEmpty){
             log("Please enter feedback before proceeding");
             return;
           }
           if(_feedbackRating == null || _feedbackRating == 0.0){
             log("Please give us Star Rating");
             return;
           }
          },
          icon: const Icon(Icons.thumb_up_alt_outlined),
          label: const Text('Send Feedback'),
        ),
      ),
    );
  }

}

class CustomStarRating extends StatelessWidget {
  const CustomStarRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Leftmost star
        Transform.translate(
          offset: Offset(0, 10), // Moves star slightly down
          child: Icon(Icons.star, size: 40, color: Colors.amber),
        ),
        // Second star
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Transform.translate(
            offset: Offset(0, -10), // Moves star slightly up
            child: Icon(Icons.star, size: 50, color: Colors.amber),
          ),
        ),
        // Center star (biggest)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(Icons.star, size: 60, color: Colors.amber),
        ),
        // Fourth star
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Transform.translate(
            offset: Offset(0, -10), // Moves star slightly up
            child: Icon(Icons.star, size: 50, color: Colors.amber),
          ),
        ),
        // Rightmost star
        Transform.translate(
          offset: Offset(0, 10), // Moves star slightly down
          child: Icon(Icons.star, size: 40, color: Colors.amber),
        ),
      ],
    );
  }
}
