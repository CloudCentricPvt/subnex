import 'dart:developer';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sublet/utils/constants/k_sizes.dart';
import 'package:sublet/utils/helpers/helper_functions.dart';
import 'package:sublet/utils/reusable_widgets/k_image_dialog.dart';

import '../../utils/constants/k_colors.dart';
import '../../utils/constants/t_texts.dart';
import '../../utils/reusable_widgets/k_text_input.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductState();
}

class _AddProductState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController productNameInput = TextEditingController();
  final TextEditingController productCategoryInput = TextEditingController();

  File? _image1;
  File? _image2;
  File? _image3;
  File? _videoFile;

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post AD",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //productName(),
                      KTextInput(
                          inputController: productNameInput,
                          hint: "Product Name *",
                          textError: "Please enter Product Name"),

                      const SizedBox(height: KSizes.spaceBtwItems_16),
                      KTextInput(
                          inputController: productCategoryInput,
                          hint: "Product Category",
                          textError: "Please enter Product Category"),

                      const SizedBox(height: KSizes.spaceBtwItems_16),
                      KTextInput(
                          inputController: productCategoryInput,
                          hint: "Product Sub Category",
                          textError: "Please enter Product Sub Category"),

                      const SizedBox(height: KSizes.spaceBtwItems_16),
                      KTextInput(
                          inputController: productCategoryInput,
                          hint: "Detailed Description *",
                          textError: "Please enter Detailed Description"),

                      const SizedBox(height: KSizes.spaceBtwItems_16),
                      KTextInput(
                          inputController: productCategoryInput,
                          hint: "Availability *",
                          textError: "Please enter Availability"),

                      const SizedBox(height: KSizes.spaceBtwItems_16),
                      KTextInput(
                          inputController: productCategoryInput,
                          hint: "Rental Duration *",
                          textError: "Please enter Rental Duration"),

                      const SizedBox(height: KSizes.spaceBtwItems_16),
                      KTextInput(
                          inputController: productCategoryInput,
                          hint: "Rental Fee *",
                          textError: "Please enter Rental Fee"),

                      //const SizedBox(height: KSizes.spaceBtwSections),
                      //_wAddProduct(context, _formKey),
                    ],
                  )),
              const SizedBox(height: KSizes.spaceBtwItems_24),
              Text(
                  "We suggest you to upload image(s) to gain more product reach.",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: KColors.appSecondaryGrey,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: KSizes.spaceBtwItems_24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _wCaptureImg(_image1, 1),
                  _wCaptureImg(_image2, 2),
                  _wCaptureImg(_image3, 3)
                ],
              ),
              const SizedBox(height: KSizes.spaceBtwItems_24),
              GestureDetector(
                onTap: () {
                  _openGalleryToTakeVideo();
                },
                child: _wUploadVideo(),
              ),
              const SizedBox(height: KSizes.spaceBtwItems_16),
              _wTermAndConditions(),
              const SizedBox(height: KSizes.spaceBtwItems_24),
              _wAddProduct(context, _formKey)
            ],
          ),
        ),
      ),
    );
  }

  /*Widget productName() {
    return TextFormField(
      style: const TextStyle(fontWeight: FontWeight.w400),
      cursorErrorColor: KColors.appPrimary,
      cursorColor: KColors.appPrimaryGrey,
      validator: (value) =>
          KValidator.requiredField(value, "Product Name is mandatory"),
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: KTextString.userName,
          labelStyle: TextStyle(color: KColors.appPrimary)),
    );
  }*/

  _wAddProduct(BuildContext context, GlobalKey<FormState> formKey) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
            ),
            onPressed: () async {
              onClick(formKey);
            },
            child: Text(
              KTextString.submit,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            )));
  }

  void onClick(GlobalKey<FormState> formKey) {
    // -- Validation Check
    if (!formKey.currentState!.validate()) {
      return;
    }
    // -- Get Info & Add Product
    String productName = productNameInput.text.toString().trim();
    String productCategory = productCategoryInput.text.toString().trim();

    print("Name : $productName");
    print("Category : $productCategory");
  }

  _wCaptureImg(File? imageFile, int index) {
    return GestureDetector(
      onTap: () {
        imageFile != null
            ? showDialog(
                context: context,
                builder: (_) =>
                    KImageDialog(imagePath: imageFile.path, kContext: context))
            : _openCamera(index);
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: imageFile != null
            ? Image.file(
                fit: BoxFit.cover,
                File(imageFile.path),
                width: 100,
                height: 100,
              )
            : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset("assets/icons/placeholder_image_icon.png",width: 40,height: 40,scale: 3,),
            ),
      ),
    );
  }

  void _openCamera(int? index) async {
    // Pick an image from the gallery
    final capturedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    // Check if an image was picked
    if (capturedImg == null) return;
    // Read image bytes asynchronously
    final bytes = await capturedImg.readAsBytes();
    // Get the temporary directory
    final tempDir = await getTemporaryDirectory();
    // Create a file in the temporary directory
    File file = await File('${tempDir.path}/${capturedImg.name}.png').create();
    // Write bytes to the file asynchronously
    await file.writeAsBytes(bytes);
    // Update the state with the new image file
    setState(() {
      switch (index) {
        case 1:
          _image1 = file;
          break;
        case 2:
          _image2 = file;
          break;
        case 3:
          _image3 = file;
          break;
      }
    });
  }

  Widget ImageDialog(imagePath, context) {
    return Dialog(
      child: Container(
        width: 360,
        height: 600,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: const Border(
              left: BorderSide(width: 8, color: KColors.appPrimaryGrey),
              right: BorderSide(width: 8, color: KColors.appPrimaryGrey),
              bottom: BorderSide(width: 8, color: KColors.appPrimaryGrey),
              top: BorderSide(width: 8, color: KColors.appPrimaryGrey),
            )),
        child: Stack(fit: StackFit.expand, children: [
          Image.file(fit: BoxFit.cover, File(imagePath)),
          Positioned(
              top: 12,
              right: 12,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    //border: Border.all(width: 2, color: KColors.appBlack),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ))
        ]),
      ),
    );
  }

  void _openGalleryToTakeVideo() async {
    final pickedFile = await ImagePicker().pickVideo(
        source: ImageSource.gallery,
        preferredCameraDevice: CameraDevice.front,
        maxDuration: const Duration(minutes: 10));
    XFile? xFilePick = pickedFile;
    setState(
      () {
        if (xFilePick != null) {
          _videoFile = File(pickedFile!.path);
          log("PickedVideo: $_videoFile");
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  _wUploadVideo() {
    return Container(
      width: KHelperFunctions.screenWidth(),
      height: 90,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        border: Border.all(),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/icons/upload_image_icon.png",width: 56,height: 48,color: KColors.appSecondaryGrey),
          const SizedBox(
            height: KSizes.spaceBtwItems_08,
          ),
          Text("Upload a video of your product.",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400, color: KColors.appSecondaryGrey))
        ],
      ),
    );
  }

  _wTermAndConditions() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// CheckBox
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: SizedBox(
            width: 20,
            height: 24,
            child: Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              },
              visualDensity: VisualDensity.compact,
            ),
          ),
        ),

        /// Text Term & Condition
        Flexible(
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: 'By clicking on Continue, you are agreeing to our ',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      letterSpacing: 0.5,
                    )),
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    //openWebsite();
                  },
                text: 'Term & Conditions',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(letterSpacing: 0.5, color: Colors.blue.shade700)),
          ])),
        )
      ],
    );
  }

}


