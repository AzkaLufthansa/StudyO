import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_o/utils/app_colors.dart';


import '../../utils/dimens.dart';

class MyClassesSection extends StatelessWidget {
  const MyClassesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(AppDimens.marginPaddingSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section Title
                Text(
                  'My Classes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),

            const SizedBox(height: AppDimens.marginPaddingMedium,),

            // Classes Card
            ListView.separated(
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

            const SizedBox(height: AppDimens.marginPaddingMedium,),

            // See More Button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimens.radiusExtraLarge)
                    )
                  )
                ),
                
                onPressed: () {
                  Get.toNamed('/classroom');
                }, 
                child: Text(
                  'See More',
                )
              ),
            )
          ],
        )
      )
    );
  }
}