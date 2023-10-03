// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:iq_app/core/bloc_progress.dart';
import 'package:iq_app/core/something_went_wrong.dart';
import 'package:iq_app/ui/home_page/tabs/bloc/questions_bloc.dart';
import 'question_modesl.dart';

class TakeIQTest extends StatefulWidget {
  const TakeIQTest({super.key});

  @override
  State<TakeIQTest> createState() => _TakeIQTestState();
}

int counter = 0;

class _TakeIQTestState extends State<TakeIQTest> {
  List<Question> questions = [];
  List<Icon> icons = [];

  void loadData() async {
    String jsonString = await rootBundle.loadString('assets/json_question.json');
    questions = Question.fromJsonList(jsonString);
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Topic: Countries',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => QuestionsBloc(),
          child: BlocBuilder<QuestionsBloc, QuestionsState>(
            builder: (context, state) {
              if (questions.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                );
              }
              if (state.blocProgress == BlocProgress.FAILED) {
                return const SomethingWentWrong();
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Container(
                      height: 300,
                      width: double.infinity,
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          questions[counter].question,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // Text(questions[0].question),
                    SizedBox(height: 40.h),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: questions[0].options.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            questions[counter].options[index],
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                          onTap: () {
                            if (questions[counter].options[index] == questions[counter].answer) {
                              print('correct');
                              icons.add(
                                Icon(
                                  Icons.done,
                                  color: Colors.green.shade800,
                                ),
                              );
                            } else {
                              print('wrong');
                              icons.add(
                                Icon(
                                  Icons.exposure_minus_1_outlined,
                                  color: Colors.red.shade800,
                                ),
                              );
                            }
                            if (counter + 1 < questions.length) {
                              setState(() {
                                counter++;
                              });
                            }
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(height: 1, color: Colors.black),
                    ),
                    const Divider(height: 1, color: Colors.black),
                    SizedBox(height: 40.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: icons,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}



   // AnwerItem(
                    //   letter: 'A) ',
                    //   text: myAnswersList[counter],
                    //   onTap: () {
                    //     if (counter + 1 < myQuestionsList.length) {
                    //       setState(() {
                    //         counter++;
                    //       });
                    //     }
                    //   },
                    // );
        //   },
        // ),
            // const AnwerItem(
            //   letter: 'B) ',
            //   text: 'France',
            // ),
            // const AnwerItem(
            //   letter: 'C) ',
            //   text: 'England',
            // ),
            // const AnwerItem(
            //   letter: 'D) ',
            //   text: 'USA',
            // ),


