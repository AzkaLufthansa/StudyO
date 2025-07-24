import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_o/utils/app_colors.dart';
import 'package:study_o/utils/dimens.dart';

class ClassroomDashboard extends StatelessWidget {
  const ClassroomDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Classroom Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(AppDimens.marginPaddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    const SizedBox(height: 8),
                    Card(
                      color: const Color.fromARGB(255, 18, 1, 23),
                      child: Container(
                        padding: EdgeInsets.all(AppDimens.marginPaddingSmall),
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () {Get.toNamed('/material');}, child: const Text('Learn'), style: TextButton.styleFrom(backgroundColor: Colors.transparent),)
                        ),
                      ),
                    Card(
                      color: const Color.fromARGB(255, 18, 1, 23),
                      child: Container(
                        padding: EdgeInsets.all(AppDimens.marginPaddingSmall),
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () {Get.toNamed('/quiz');}, child: const Text('Quiz'), style: TextButton.styleFrom(backgroundColor: Colors.transparent),)
                        ),
                      ),
                    Card(
                      color: const Color.fromARGB(255, 18, 1, 23),
                      child: Container(
                        padding: EdgeInsets.all(AppDimens.marginPaddingSmall),
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () {Get.toNamed('/material');}, child: const Text('Flashcard'), style: TextButton.styleFrom(backgroundColor: Colors.transparent),)
                        ),
                      ),
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
                                    Text('M. Arizal Maulana'),
                                    Container(
                                      width: 100,
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
                                    Text('Dimastio Setiawan'),
                                    Container(
                                      width: 100,
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