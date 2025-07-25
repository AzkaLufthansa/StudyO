// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:study_o/cubit/get_flashcard/get_flashcard_cubit.dart';
import 'package:study_o/injection_container.dart';
import 'package:study_o/utils/app_colors.dart';
import 'package:study_o/utils/dimens.dart';

class FlashcardPage extends StatefulWidget {
  const FlashcardPage({
    super.key,
  });

  @override
  State<FlashcardPage> createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  final RefreshController refreshController = RefreshController();

  @override
  void dispose() {
    refreshController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<FlashcardListCubit>()..fetchFlashcards(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          title: const Text('Flashcard'),
          centerTitle: true,
        ),
        body: BlocBuilder<FlashcardListCubit, FlashcardListState>(
          builder: (context, state) {
            if (state is FlashcardListLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is FlashcardListFailure) {
              return Center(child: Text('Error: ${state.message}'));
            }

            if (state is FlashcardListSuccess) {
              final flashcards = state.flashcards;

              if (flashcards.isEmpty) {
                return const Center(child: Text('No flashcards available.'));
              }

              return SmartRefresher(
                controller: refreshController,
                onRefresh: () {
                  BlocProvider.of<FlashcardListCubit>(context).fetchFlashcards();
              
                  refreshController.refreshCompleted();
                },
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<FlashcardListCubit, FlashcardListState>(
                          builder: (_, __) {
                            return GridView.builder(
                              itemCount: flashcards.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: AppDimens.marginPaddingSmall,
                                mainAxisSpacing: AppDimens.marginPaddingSmall,
                                mainAxisExtent: 300,
                              ),
                              itemBuilder: (context, index) {
                                final flashcard = flashcards[index];
                                return FlashcardWidget(
                                  question: flashcard.front,
                                  answer: flashcard.back,
                                );
                              },
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            return const SizedBox();
          },
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