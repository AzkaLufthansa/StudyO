import 'dart:math';

import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:study_o/utils/app_colors.dart';
import 'package:study_o/utils/dimens.dart';

class FlashcardPage extends StatelessWidget {
  const FlashcardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Flashcard'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppDimens.marginPaddingSmall,
                  mainAxisSpacing: AppDimens.marginPaddingSmall,
                  mainAxisExtent: 300
                ), 
                itemBuilder: (context, index) => FlashcardWidget(
                  question: 'What is the integer data type used for in c++?',
                  answer: 'Store whole numbers, meaning numbers without any fractional or decimal parts.'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlashcardWidget extends StatelessWidget {
  final String question;
  final String answer;

  const FlashcardWidget({
    super.key,
    required this.question,
    required this.answer
  });

  @override
  Widget build(BuildContext context) {
    final Color randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return Material(
      color: randomColor,
      borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
        onTap: () {
          showDialog(
            context: context, 
            builder: (context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Center(
                  child: FlashCard(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.7,
                    frontWidget: () => Container(
                      padding: const EdgeInsets.all(AppDimens.marginPaddingExtraLarge),
                      decoration: BoxDecoration(
                        color: randomColor,
                        borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
                      ),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          answer,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ),
                    backWidget: () => Container(
                      padding: const EdgeInsets.all(AppDimens.marginPaddingExtraLarge),
                      decoration: BoxDecoration(
                        color: randomColor,
                        borderRadius: BorderRadius.circular(AppDimens.radiusLarge)
                      ),
                      width: double.infinity,
                      height: 100,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          question,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    )
                  )
                ),
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.all(AppDimens.marginPaddingSmall),
          decoration: BoxDecoration(
          ),
          child: Center(
            child: Text(
              question,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}