import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iq_app/core/roots/main_route_generator.dart';
import 'package:iq_app/splash_page/bloc/splash_bloc.dart';
import 'package:iq_app/splash_page/splash_auth_status.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SplashBloc()),
          ],
          child: const MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashAuthStatus>(
      builder: (context, state) {
        return ScreenUtilInit(
          //TODO give correct size
          designSize: const Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                fontFamily: 'Raleway',
                primarySwatch: Colors.blue,
              ),
              onGenerateRoute: MainRouteGenerator().generateRoute,
              // home: const HomePage(),
            );
          },
        );
      },
    );
  }
}
