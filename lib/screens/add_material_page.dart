import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:study_o/cubit/flashcard/flashcard_cubit.dart';
import 'package:study_o/cubit/post_material/post_material_cubit.dart';
import 'package:study_o/injection_container.dart';
import 'package:study_o/utils/app_colors.dart';

import '../models/post_material_request_model.dart';
import '../utils/dimens.dart';

class AddMaterialPage extends StatefulWidget {
  const AddMaterialPage({Key? key}) : super(key: key);

  @override
  State<AddMaterialPage> createState() => _AddMaterialPageState();
}


class _AddMaterialPageState extends State<AddMaterialPage> {
  bool generateFlashcardNow = false;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostMaterialCubit>(
          create: (_) => sl<PostMaterialCubit>(),
        ),
        BlocProvider<FlashcardCubit>(
          create: (_) => sl<FlashcardCubit>(),
        ),
      ],
      child: BlocConsumer<FlashcardCubit, FlashcardState>(
        listener: (_, state) {
          if (state is FlashcardSuccess) {
            SmartDialog.dismiss();
            Get.snackbar('Flashcards Generated', 'Berhasil dibuat!',
                backgroundColor: Colors.green, colorText: Colors.white);
            Get.close(1);
          } else if (state is FlashcardError) {
            SmartDialog.dismiss();
            Get.snackbar('Failed', state.message,
                backgroundColor: Colors.red, colorText: Colors.white);
          }
        },
        builder: (context, flashcardState) {
          // Tampilkan loading dari builder
          if (flashcardState is FlashcardLoading) {
            SmartDialog.showLoading(msg: 'Generating flashcards...');
          }

          return BlocListener<PostMaterialCubit, PostMaterialState>(
            listener: (context, state) async {
              if (state is PostMaterialLoading) {
                SmartDialog.showLoading();
              }

              if (state is PostMaterialSuccess) {
                SmartDialog.dismiss();
                Get.snackbar('Success', 'Material created successfully',
                    backgroundColor: Colors.green, colorText: Colors.white);

                if (generateFlashcardNow) {
                  // Jangan showLoading dua kali di sini!
                  await context.read<FlashcardCubit>().generateFlashcards(
                        titleController.text,
                        descriptionController.text,
                        state.materialId
                      );
                } else {
                  Get.close(1);
                }
              }

              if (state is PostMaterialFailure) {
                SmartDialog.dismiss();
                Get.snackbar('Error', state.errorMessage,
                    backgroundColor: Colors.red, colorText: Colors.white);
              }
            },
            child: Scaffold(
              backgroundColor: AppColors.primaryColor,
              appBar: AppBar(
                title: const Text('Add Lesson'),
                centerTitle: true,
              ),
              bottomNavigationBar: Container(
                padding: const EdgeInsets.only(
                  top: AppDimens.marginPaddingMedium,
                  right: AppDimens.marginPaddingMedium,
                  left: AppDimens.marginPaddingMedium,
                  bottom: AppDimens.marginPaddingLarge,
                ),
                child: BlocBuilder<PostMaterialCubit, PostMaterialState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.all(AppDimens.marginPaddingLarge),
                        ),
                      ),
                      onPressed: () {
                        final title = titleController.text.trim();
                        final content = descriptionController.text.trim();
                    
                        if (title.isEmpty || content.isEmpty) {
                          Get.snackbar(
                            'Invalid input',
                            'Lesson title and description must be filled',
                            // backgroundColor: Colors.orange,
                            colorText: Colors.white,
                          );
                          return;
                        }
                    
                        final request = PostMaterialRequestModel(
                          title: title,
                          content: content,
                          classroomId: Get.arguments ?? '',
                        );
                    
                        BlocProvider.of<PostMaterialCubit>(context).fetchPostMaterials(request);
                      },
                      child: const Text(
                        'Create',
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  }
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(AppDimens.marginPaddingLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Lesson Title', style: TextStyle(fontSize: 18)),
                              const SizedBox(height: 20),
                              TextField(
                                controller: titleController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Programming 101',
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text('Lesson Description', style: TextStyle(fontSize: 18)),
                              const SizedBox(height: 20),
                              TextField(
                                controller: descriptionController,
                                keyboardType: TextInputType.multiline,
                                minLines: 10,
                                maxLines: 10,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'This is where you will fill the field with the content of this lesson.',
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Generate Flashcards', style: TextStyle(fontSize: 18)),
                                  Switch(
                                    value: generateFlashcardNow,
                                    onChanged: (value) {
                                      setState(() {
                                        generateFlashcardNow = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
