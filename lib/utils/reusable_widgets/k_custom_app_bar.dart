import 'package:flutter/material.dart';

class KCustomAppBar extends StatelessWidget {
  final String screenTitle;
  const KCustomAppBar({super.key, required this.screenTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0.0, right: 16.0),
      dense: true,
      leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back,color: Colors.blueAccent,)),
      title: Center(
          child: Text(
            screenTitle,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.black,fontSize: 24),
          )),
    );
  }
}
