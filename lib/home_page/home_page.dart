import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iq_app/core/preference_services/preference_services.dart';
import 'package:iq_app/core/roots/app_routes.dart';
import 'package:iq_app/home_page/home_page_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name;

  void getName() async {
    String? nameD = await PreferencesServices.getName();
    if (nameD != null) {
      setState(() {
        nameD = name;
      });
    }
  }

  @override
  void initState() {
    // Future.delayed(Duration.zero, () {});
    getName();
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
            Text(
              'Hi ' '$name',
              style: const TextStyle(fontSize: 24),
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
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      // _showMyDialog();
    });
    super.initState();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Neumorphic(
              //   style: NeumorphicStyle(
              //       shape: NeumorphicShape.concave,
              //       boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              //       depth: 8,
              //       lightSource: LightSource.topLeft,
              //       color: Colors.grey),
              //   child: NeumorphicText(
              //     "I love flutter",
              //     style: const NeumorphicStyle(
              //       depth: 4, //customize depth here
              //       color: Colors.white, //customize color here
              //     ),
              //     textStyle: NeumorphicTextStyle(
              //       fontSize: 18, //customize size here
              //       // AND others usual text style properties (fontFamily, fontWeight, ...)
              //     ),
              //   ),
              // ),
              const SizedBox(height: 70),

              Center(
                child: SvgPicture.asset(
                  'assets/images/Component 1.svg',
                  width: 350.w,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 70),

              ListBody(
                children: <Widget>[
                  const Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Age',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _ageController,
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  final name = _nameController.text.trim();
                  final age = _ageController.text.trim();
                  await PreferencesServices.saveName(name);
                  await PreferencesServices.saveAge(age);

                  const CircularProgressIndicator();

                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, AppRoutes.homePage);
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 16.w),
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      width: 0.5.w,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
