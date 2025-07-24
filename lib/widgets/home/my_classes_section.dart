import 'package:flutter/material.dart';
import 'package:study_o/utils/app_colors.dart';

import '../../utils/dimens.dart';

class MyClassesSection extends StatelessWidget {
  const MyClassesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Title
        Row(
          children: [
            Text(
              'My Classes',
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ],
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
            return Container(
              padding: const EdgeInsets.all(AppDimens.marginPaddingMedium),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(AppDimens.radiusLarge)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PENGENALAN KODING',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'Grade A',
                  ),
                  const SizedBox(height: AppDimens.marginPaddingExtraLarge,),
                  Text(
                    'AZKA LUFTHANSA',
                  ),
                ],
              ),
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
            onPressed: () {}, 
            child: Text(
              'See More',
            )
          ),
        )
      ],
    );
  }
}