import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iq_app/main_route_generator.dart';
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

//TODO move to diff page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      this._showMyDialog();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Container(
          height: 120,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
              ),
              SvgPicture.asset(
                'assets/images/Component 1.svg',
                height: 70,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Hi David',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              'Welcome to Dr.iQ',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HomePageItem(
                  icon: Icons.text_increase_sharp,
                  text: 'Take IQ Test',
                  color: Color(0xffc30010),
                ),
                HomePageItem(
                  icon: Icons.data_object_outlined,
                  text: 'History',
                  color: Color(0xff17181d),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomePageItem(
                  icon: Icons.school_outlined,
                  text: 'Improve IQ',
                  color: Colors.blue.shade900,
                ),
                const HomePageItem(
                  icon: Icons.settings_suggest_outlined,
                  text: 'Settings',
                  color: Color(0xff2ecc71),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HomePageItem(
                  icon: Icons.person_add_alt_1_outlined,
                  text: 'Profile ',
                  color: Color(0xfffd830d),
                ),
                HomePageItem(
                  icon: Icons.adobe_outlined,
                  text: 'About',
                  color: Color(0xff13481d),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Personal Info'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Name'),
                TextFormField(),
                const SizedBox(height: 20),
                const Text('Age'),
                TextFormField(),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
//TODO move to diff page

class HomePageItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;

  const HomePageItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      width: 189,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          const Spacer(),
          Icon(
            icon,
            size: 60,
            color: Colors.white,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
