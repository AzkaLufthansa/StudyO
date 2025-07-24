import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_o/utils/app_colors.dart';

import '../utils/dimens.dart';

class Classroom extends StatelessWidget {
  const Classroom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('My Classes'),
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
        margin: const EdgeInsets.all(16),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 3,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Material(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/classroom_dashboard');
                    },
                    splashColor: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimens.marginPaddingMedium),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Programming 101',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              'Grade A',
                            ),
                            const SizedBox(height: AppDimens.marginPaddingExtraLarge,),
                            Text(
                              'M. Arizal Maulana',
                            ),
                          ]      
                        ),
                    )
                  )
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: AppDimens.marginPaddingMedium,);
          },
        ),
      ),
    );
  }
}