// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:iq_app_mobile/core/app_colors.dart';
import 'package:iq_app_mobile/core/preference_services/preference_services.dart';
import 'package:iq_app_mobile/core/preference_services/shpref_keys.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/bloc/questions_bloc.dart';
import 'package:rive/rive.dart';

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

                List<String>? existingResultsList = await preferencesServices.getResultList(ShPrefKeys.resultList);
                List<String>? existingDateList = await preferencesServices.getDatesList(ShPrefKeys.dateList);
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
