import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/dimens.dart';

class BottomSheetJoinClass extends StatelessWidget {
  const BottomSheetJoinClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimens.radiusLarge)
        )
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDimens.radiusLarge),
              topRight: Radius.circular(AppDimens.radiusLarge),
            ),
              onTap: () {},
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppDimens.marginPaddingExtraLarge,
                    bottom: AppDimens.marginPaddingLarge,
                  ),
                  child: Text(
                    'Create Class',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const Divider(height: 1,),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {Get.toNamed('/classroom_search');},
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppDimens.marginPaddingExtraLarge,
                    bottom: AppDimens.marginPaddingLarge,
                  ),
                  child: Text(
                    'Join Public Class',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const Divider(height: 1,),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppDimens.marginPaddingLarge,
                    bottom: AppDimens.marginPaddingExtraLarge,
                  ),
                  child: Text(
                    'Join Private Class',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}