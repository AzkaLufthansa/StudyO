import 'package:flutter/material.dart';
import '../utils/dimens.dart';

class LearnModal extends StatelessWidget {
  const LearnModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Dialog(
            backgroundColor: const Color.fromARGB(255, 53, 0, 100),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(AppDimens.marginPaddingLarge),
              child: Column(
                children: [
                  Text("Fundamental 101", style: TextStyle(fontSize: 20),),
                  SizedBox(height: 15,),
                  Text("Fundamental 101",),
                  SizedBox(height: 15,),
                    ],
              )
                ),
            ),
        ],
    );
  }
}