import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iq_app/main_route_generator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashBloc = SplashBloc();

  // ignore: prefer_typing_uninitialized_variables
  // var savedValue;

  // void getMapInfo() async {
  //   savedValue = await PreferencesServices.getMapFromSharedPreferences();
  // }

  // String? systemPasscode;

  // void getDBPasscode() async {
  //   String? passcode = await PreferencesServices.getPasscode();
  //   if (passcode != null) {
  //     setState(() {
  //       systemPasscode = passcode;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();

    // getMapInfo();
    splashBloc.setupInitialSettings();
    // getDBPasscode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashAuthStatus>(
      bloc: splashBloc,
      listener: (context, state) {
        switch (state) {
          case SplashAuthStatus.initial:
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.splashPage,
              (route) => false,
            );
            break;
          case SplashAuthStatus.authorized:
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.homePage,
              (route) => false,
            );
            break;
          case SplashAuthStatus.notAuthorized:
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.homePage,
              (route) => false,
            );
            break;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 250.h),
            Center(
              child: SvgPicture.asset(
                'assets/images/Component 1.svg',
                width: 260.w,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 170.h),
            const Center(
              child: CircularProgressIndicator(color: Colors.black),
            ),
            SizedBox(height: 155.h),
          ],
        ),
      ),
    );
  }
}
//TODO move to diff page

class SplashBloc extends Cubit<SplashAuthStatus> {
  SplashBloc() : super(SplashAuthStatus.initial);

  Future setupInitialSettings() async {
    // final token = await PreferencesServices.getToken();
    final token = 'Abror';
    // ApiProvider.create(token: token);

    await Future.delayed(const Duration(seconds: 2));

    // emit(token == null ? SplashAuthStatus.notAuthorized : SplashAuthStatus.authorized);
    emit(SplashAuthStatus.authorized);
  }
}
//TODO move to diff page

enum SplashAuthStatus {
  initial,
  authorized,
  notAuthorized,
}
