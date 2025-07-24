import 'package:flutter/material.dart';
import 'package:study_o/utils/app_colors.dart';
import 'package:study_o/utils/dimens.dart';

import '../widgets/home/my_classes_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Studyo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimens.marginPaddingLarge),
        child: Column(
          children: [
            // My Classes Section
            MyClassesSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context, 
            builder: (_) {
              return BottomSheetJoinClass();
            }
          );
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 105, 1, 114),
      ),
    );
  }
}

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
              onTap: () {},
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