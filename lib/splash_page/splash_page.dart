import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iq_app/core/roots/app_routes.dart';
import 'package:iq_app/splash_page/bloc/splash_bloc.dart';
import 'package:iq_app/splash_page/splash_auth_status.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashBloc = SplashBloc();

  @override
  void initState() {
    splashBloc.setupInitialSettings();
    super.initState();
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
