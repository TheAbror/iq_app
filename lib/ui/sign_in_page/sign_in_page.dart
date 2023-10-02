import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iq_app/core/preference_services/preference_services.dart';
import 'package:iq_app/core/roots/app_routes.dart';

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

                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, AppRoutes.homePage);
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
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
                        fontSize: 20.sp,
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
