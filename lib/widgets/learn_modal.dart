import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/dimens.dart';

class LearnModal extends StatelessWidget {
  const LearnModal({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.vertical(
      //     top: Radius.circular(AppDimens.radiusLarge)
      //   )
      // ),
      // width: screenWidth*0.8,
      // height: screenHeight*0.8,
        child: Material(
          color: const Color.fromARGB(255, 20, 0, 38),
          child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text("apalah wkwk")
            ],
          ),
        )
      );
  }
}