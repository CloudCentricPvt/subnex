import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:sublet/utils/reusable_widgets/k_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants/k_sizes.dart';
import '../../utils/reusable_widgets/k_custom_app_bar.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
            const KCustomAppBar(screenTitle: "Contact Us"),
            const SizedBox(
              height: KSizes.spaceBtwItems_12,
            ),
            _wHeaderText(),
            const SizedBox(
              height: KSizes.spaceBtwItems_24,
            ),
            _wContactViaPhone(),
            const SizedBox(
              height: KSizes.spaceBtwItems_24,
            ),
            _wContactViaEmail(),
            const SizedBox(
              height: KSizes.spaceBtwItems_24,
            ),
            _wContactViaWhatsApp()
          ],
        ),
      ),
    );
  }

  _wHeaderText() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Tell us how we can help",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.blueAccent.shade200, fontSize: 22)),
          const SizedBox(
            height: KSizes.spaceBtwItems_12,
          ),
          Text("Our crew members are standing by\nservice & support",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black87, fontWeight: FontWeight.w400))
        ],
      ),
    );
  }

  _wContactViaPhone() {
    return _wContactUsCard(
        "Phone Call", "Call us 24*7, we will answer you.", "9999139923");
  }

  _wContactViaEmail() {
    return _wContactUsCard(
        "Email", "Get solutions beamed to your inbox.", "9999139923");
  }

  _wContactViaWhatsApp() {
    return _wContactUsCard(
        "WhatsApp Chat", "Start a conversion on WhatsApp now!", "+919456943155");
  }

  _wContactUsCard(String title, String subTitle, String contactDetail) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(6.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.blueAccent, fontWeight: FontWeight.w400)),
            const SizedBox(
              height: KSizes.spaceBtwItems_08 - 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(subTitle,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500)),

                GestureDetector(
                  onTap: (){
                    title.contains("WhatsApp") ? openWhatsAppChat(contactDetail) : title.contains("Email") ? openEmail(contactDetail) : openDialPad(contactDetail, context);
                  },
                  child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircleAvatar(
                          backgroundColor: Colors.blueAccent.shade100,
                          child: const Icon(
                            color: Colors.white,
                            Icons.navigate_next,
                            size: 14,
                          ))),
                )
              ],
            ),
            const SizedBox(
              height: KSizes.spaceBtwItems_08 - 4,
            ),
            Text(contactDetail,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.blueAccent, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  void openWhatsAppChat(String phoneNumber) async {
    try {
      final String whatsappUrl = "https://wa.me/$phoneNumber";
      final Uri uri = Uri.parse(whatsappUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        print('Could not launch $whatsappUrl');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void openEmail(String email) async{

  }

  void openDialPad(String number, BuildContext context) async{
    /// ---  Will Call Directly
    FlutterPhoneDirectCaller.callNumber(number);

    /// --- Will type number on dial text pad of
    final call = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(call)) {
      launchUrl(call);
    } else {
      throw Dialogs.materialDialog(
          msg:
          "Looks like your device does not have proper app to use this feature.",
          title: "Opps!",
          color: Colors.white,
          context: context,
          actions: [
            IconsButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'Okay',
              color: Colors.red,
              textStyle: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(color: Colors.white),
              iconColor: Colors.white,
            )
          ]);
    }
  }

  void openUrl() async {
    final Uri uri = Uri.parse('https://cccinfotech.com');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        print('Could not launch url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

}
