// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:iq_app_mobile/core/app_colors.dart';
import 'package:iq_app_mobile/core/bloc_progress/bloc_progress.dart';
import 'package:iq_app_mobile/core/preference_services/preference_services.dart';
import 'package:iq_app_mobile/core/preference_services/shpref_keys.dart';
import 'package:iq_app_mobile/core/primary_loader.dart';
import 'package:iq_app_mobile/core/something_went_wrong.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/bloc/questions_bloc.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/widgets/question_text.dart';
import 'package:rive/rive.dart';

class TakeIQTest extends StatefulWidget {
  const TakeIQTest({super.key});

  @override
  State<TakeIQTest> createState() => _TakeIQTestState();
}

class _TakeIQTestState extends State<TakeIQTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textMain,
        title: Text(
          'Test',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocProvider(
            create: (context) => QuestionsBloc()..getQuestions(),
            child: BlocConsumer<QuestionsBloc, QuestionsState>(
              listener: (context, state) async {
                if (state.questions.length == (state.counter + 1)) {
                  finishDialog(context, state);
                }
              },
              builder: (context, state) {
                if (state.blocProgress == BlocProgress.IS_LOADING) {
                  return const PrimaryLoader();
                }

                if (state.blocProgress == BlocProgress.FAILED) {
                  return const SomethingWentWrong();
                }

                final counter = state.counter;
                final iconsList = state.icons;

                return Column(
                  children: [
                    SizedBox(height: 20.h),
                    Expanded(
                      flex: 3,
                      child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.questions.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              QuestionText(
                                counter: counter,
                                state: state,
                              ),
                              SizedBox(height: 20.h),
                              Divider(
                                thickness: 1,
                                height: 1,
                              ),
                              SizedBox(height: 10.h),
                              OptionsText(
                                counter: counter,
                                state: state,
                              ),
                              SizedBox(height: 100.h),
                            ],
                          );
                        },
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: iconsList,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> finishDialog(BuildContext context, QuestionsState state) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: const Text(
                  'Congratulations!!!',
                  style: TextStyle(
                    color: AppColors.textMain,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 390.h,
                width: 400.w,
                child: const RiveAnimation.asset('assets/images/5103-10277-handshake.riv'),
              ),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  '${state.result.toString()} out of ${state.questions.length}',
                  style: TextStyle(
                    color: AppColors.textMain,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
              ),
              const SizedBox(height: 35),
              TextButton(
                onPressed: () async {
                  Navigator.pop(dialogContext);
                  Navigator.pop(dialogContext);
                  // Navigator.pop(context);
                  var resultOfTest = ((state.result / state.questions.length) * 100).toString();
                  final dateFormatter = DateFormat('dd-MM-yyyy, HH:mm');

                  final today = DateTime.now();
                  var formattedDate = dateFormatter.format(today);
                  //
                  print(formattedDate);
                  var preferencesServices = PreferencesServices();

                  List<String>? existingResultsList = await preferencesServices.getStringList(ShPrefKeys.resultList);
                  List<String>? existingDateList = await preferencesServices.getStringList(ShPrefKeys.dateList);
                  if (existingResultsList != null) {
                    existingResultsList.add(resultOfTest);
                  } else {
                    existingResultsList = [resultOfTest];
                  }
                  //
                  if (existingDateList != null) {
                    existingDateList.add(formattedDate);
                  } else {
                    existingDateList = [formattedDate];
                  }
                  await preferencesServices.saveStringList(existingResultsList);
                  await preferencesServices.saveDatesList(existingDateList);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    AppColors.textMain,
                  ),
                ),
                child: const Text(
                  'Close',
                  style: TextStyle(
                    color: AppColors.float,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class OptionsText extends StatefulWidget {
  final int counter;
  final QuestionsState state;

  const OptionsText({
    super.key,
    required this.counter,
    required this.state,
  });

  @override
  State<OptionsText> createState() => _OptionsTextState();
}

class _OptionsTextState extends State<OptionsText> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.state.questions[widget.counter].options.length,
      itemBuilder: (context, optionIndex) {
        int? selectedOptionIndex;
        return Builder(
          builder: (context) {
            var questionCounter = widget.state.questions.length;
            return GestureDetector(
              onTap: () {
                context.read<QuestionsBloc>().increaseCounter(widget.counter, questionCounter);
                setState(() {
                  selectedOptionIndex = optionIndex;
                });
                var abc = widget.state.questions[widget.counter].options[selectedOptionIndex ?? 0].option;
                var abcBool = widget.state.questions[widget.counter].options[selectedOptionIndex ?? 0].isCorrect;
                print('Selected value: $abc');
                print('$abcBool');
                if (abcBool) {
                  context.read<QuestionsBloc>().isCorrect(widget.counter, questionCounter);
                } else {
                  context.read<QuestionsBloc>().isInCorrect(widget.counter, questionCounter);
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.h),
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.textMain,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(),
                ),
                child: Text(
                  widget.state.questions[widget.counter].options[optionIndex].option,
                  style: const TextStyle(
                    color: AppColors.emirald,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
