import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/dimens.dart';

class JoinPrivateClassroomModal extends StatelessWidget {
  const JoinPrivateClassroomModal({super.key});

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
                  Text("Join Private Classroom", style: TextStyle(fontSize: 20),),
                  SizedBox(height: 15,),
                  TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Classroom ID'
                        ),
                      ),
                  SizedBox(height: 15,),
                  TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Classroom Password'
                        ),
                      ),
                  SizedBox(height: 15,),
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        const EdgeInsets.all(AppDimens.marginPaddingLarge)
                      )
                    ),
                    onPressed: () {}, 
                    child: Text(
                      'Join',
                      style: TextStyle(
                        fontSize: 15
                      ),
                    )
                  ),
                    ],
              )
                ),
            ),
        ],
    );
  }
}