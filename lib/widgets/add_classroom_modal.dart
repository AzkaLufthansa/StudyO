import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:study_o/injection_container.dart';
import 'package:study_o/models/classroom_request_model.dart';
import 'package:study_o/widgets/dropdown.dart';
import 'package:study_o/widgets/private_public_dropdown.dart';

import '../cubit/add_classroom/add_classroom_cubit.dart';
import '../utils/dimens.dart';

class AddClassroomModal extends StatefulWidget {
  const AddClassroomModal({super.key});

  @override
  State<AddClassroomModal> createState() => _AddClassroomModalState();
}

class _AddClassroomModalState extends State<AddClassroomModal> {
  final TextEditingController _nameController = TextEditingController();
  
  int grade = 1;
  int isPrivate = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddClassroomCubit>(),
      child: _content(),
    );
  }

  Widget _content() {
    return BlocConsumer<AddClassroomCubit, AddClassroomState>(
      listener: (context, state) {
        if (state is AddClassroomLoading) {
          SmartDialog.showLoading();
        }

        if (state is AddClassroomFailure) {
          SmartDialog.dismiss();

          Get.snackbar('Failed', state.errorMessage,
                backgroundColor: Colors.red, colorText: Colors.white);
        }

        
        if (state is AddClassroomSuccess) {
          SmartDialog.dismiss();

          Get.snackbar('Success', 'Class created!',
                backgroundColor: Colors.green, colorText: Colors.white);

          Get.close(2);
        }


      },
      builder: (context, state) {
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
                        controller: _nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Classroom name'
                            ),
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: ClassDropdown(classOptions: ['Grade A', 'Grade B', 'Grade C', 'Grade D', 'Grade E'], onChanged: (selected){
                            // Hardcoded mapping dari label ke ID
                            switch (selected) {
                              case 'Grade A':
                                grade = 1;
                                break;
                              case 'Grade B':
                                grade = 2;
                                break;
                              case 'Grade C':
                                grade = 3;
                                break;
                              case 'Grade D':
                                grade = 4;
                                break;
                              case 'Grade E':
                                grade = 5;
                                break;
                              default:
                                grade = 1;
                            }
                          })),
                          Expanded(child: PrivateDropdown(classOptions: ['Public', 'Private'], onChanged: (selected){
                            switch (selected) {
                              case 'Public':
                                grade = 0;
                                break;
                              case 'Private':
                                grade = 1;
                                break;
                              }
                          })),
                        ],
                      ),
                      SizedBox(height: 15,),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(
                            const EdgeInsets.all(AppDimens.marginPaddingLarge)
                          )
                        ),
                        onPressed: () async {
                          await BlocProvider.of<AddClassroomCubit>(context).fetchAddClassrooms(AddClassroomRequestModel(
                            name: _nameController.text, 
                            gradeId: grade, 
                            isPrivate: isPrivate == 1 ? true : false
                          ));
                        }, 
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
    );
  }
}