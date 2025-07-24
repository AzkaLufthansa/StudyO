import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_o/utils/app_colors.dart';
import 'package:study_o/utils/dimens.dart';

class Tutorial extends StatelessWidget {
  const Tutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Tutorial & Credits'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(AppDimens.marginPaddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(''),
            Card(
              child: Container(
                padding: const EdgeInsets.all(AppDimens.marginPaddingMedium),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Programming 101',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Kickstart your programming skill',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: AppDimens.marginPaddingMedium,),
                    Container(
                      width: double.infinity,
                      child: Material(
                        color: const Color.fromARGB(255, 18, 1, 23),
                        borderRadius: BorderRadius.circular(15),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed('/material');  
                          },
                          splashColor: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(AppDimens.marginPaddingLarge),
                            child: Text('Learn', textAlign: TextAlign.center,),
                            ),
                        ),
                      )
                    ),
                    const SizedBox(height: AppDimens.marginPaddingSmallXX,),
                    Container(
                      width: double.infinity,
                      child: Material(
                        color: const Color.fromARGB(255, 18, 1, 23),
                        borderRadius: BorderRadius.circular(15),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed('/quiz');  
                          },
                          splashColor: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(AppDimens.marginPaddingLarge),
                            child: Text('Quiz', textAlign: TextAlign.center,),
                            ),
                        ),
                      )
                    ),
                    const SizedBox(height: AppDimens.marginPaddingSmallXX,),
                    SizedBox(
                      width: double.infinity,
                      child: Material(
                        color: const Color.fromARGB(255, 18, 1, 23),
                        borderRadius: BorderRadius.circular(15),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed('/flashcard');  
                          },
                          splashColor: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(AppDimens.marginPaddingLarge),
                            child: Text('Flashcard', textAlign: TextAlign.center,),
                            ),
                        ),
                      )
                    ),
                    const SizedBox(height: AppDimens.marginPaddingSmall,),
                    Card(
                      color: const Color.fromARGB(255, 18, 1, 23),
                      child: Container(
                        padding: EdgeInsets.all(AppDimens.marginPaddingSmall),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text("Who's in this classroom", textAlign: TextAlign.center,),
                            const SizedBox(height: 8),
                            Card(
                              color: const Color.fromARGB(255, 2, 4, 52),
                              child: Container(
                                padding: EdgeInsets.all(AppDimens.marginPaddingSmall),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'M. Arizal Maulana',
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: const Color.fromARGB(255, 6, 9, 117)
                                        ), // optional background)
                                      child: Text(
                                        'Teacher',
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                                ),
                              ),
                              Card(
                              color: const Color.fromARGB(255, 40, 2, 52),
                              child: Container(
                                padding: EdgeInsets.all(AppDimens.marginPaddingSmall),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Dimastio Setiawan',
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    const SizedBox(width: AppDimens.marginPaddingSmall,),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: const Color.fromARGB(255, 105, 1, 114)
                                        ), // optional background)
                                      child: Text(
                                        '10 pts',
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                                ),
                              ),
                            ]
                          )
                        )
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}