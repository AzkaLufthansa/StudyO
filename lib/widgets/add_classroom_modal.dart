import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/dimens.dart';

class AddClassroomModal extends StatelessWidget {
  const AddClassroomModal({super.key});

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
                  Text("Add Classroom", style: TextStyle(fontSize: 20),),
                  SizedBox(height: 15,),
                  TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Classroom name'
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
                      'Create',
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