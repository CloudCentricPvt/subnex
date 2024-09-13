import 'dart:io';

import 'package:flutter/material.dart';
import '../constants/k_colors.dart';

class KImageDialog extends StatelessWidget {
  final String? imagePath;
  final BuildContext? kContext;
  const KImageDialog({super.key, this.imagePath, this.kContext});

  @override
  Widget build(BuildContext context) {
    return Dialog(

      child: Container(
        width: 360,
        height: 300,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: const Border(
              left: BorderSide(width: 8, color: KColors.appPrimaryGrey),
              right: BorderSide(width: 8, color: KColors.appPrimaryGrey),
              bottom: BorderSide(width: 8, color: KColors.appPrimaryGrey),
              top: BorderSide(width: 8, color: KColors.appPrimaryGrey),
            )),
        child: Stack(clipBehavior: Clip.none,fit: StackFit.expand, children: [
          Image.file(fit: BoxFit.cover, File(imagePath!)),
          Positioned(
              top: -20,
              right: 110,
              child: GestureDetector(
                onTap: () {
                  //Navigator.of(kContext!).pop();
                  Navigator.pop(kContext!);
                },
                child: Container(
                  height: 32,
                  width: 64,
                  decoration:  const BoxDecoration(
                    shape: BoxShape.circle,
                    //border: Border.all(width: 2, color: Colors.black54),
                    color: Colors.white,
                    //borderRadius: const BorderRadius.all(Radius.circular(8))
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
}

