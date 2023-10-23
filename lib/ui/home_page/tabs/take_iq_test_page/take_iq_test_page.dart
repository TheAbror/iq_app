import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iq_app_mobile/core/app_colors.dart';
import 'package:iq_app_mobile/core/bloc_progress/bloc_progress.dart';
import 'package:iq_app_mobile/core/primary_loader.dart';
import 'package:iq_app_mobile/core/something_went_wrong.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/bloc/questions_bloc.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/widgets/question_text.dart';

// var questionCounter = state.questions.length;
//                 var myCounter = state.counter + 7;
class TakeIQTest extends StatelessWidget {
  const TakeIQTest({super.key});

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
                if (state.questions.length == (state.counter + 1))
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('This is a typical dialog.'),
                            const SizedBox(height: 15),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(dialogContext);
                                Navigator.pop(dialogContext);
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
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
