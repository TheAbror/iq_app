import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iq_app_mobile/core/app_colors.dart';
import 'package:iq_app_mobile/core/preference_services/preference_services.dart';
import 'package:iq_app_mobile/core/roots/app_routes.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/widgets/home_page_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name = 'Abror';

  void getName() async {
    String? nameD = await PreferencesServices.getName();
    if (nameD != null) {
      nameD = name;
    }
  }

  @override
  void initState() {
    super.initState();

    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.float,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
        child: Container(
          height: 120.h,
          color: AppColors.float,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
              ),
              SvgPicture.asset(
                'assets/images/Component 3.svg',
                height: 60.h,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Text(
              'Hi ' '$name',
              style: TextStyle(fontSize: 24.sp),
            ),
            // Text(
            //   'Welcome to Dr.iQ',
            //   style: TextStyle(
            //     fontSize: 28.sp,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomePageItem(
                  icon: Icons.text_increase_sharp,
                  text: 'Take IQ Test',
                  color: const Color(0xffc30010),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.takeiqtest);
                  },
                ),
                HomePageItem(
                  icon: Icons.add_task_sharp,
                  text: 'Todos',
                  color: AppColors.iconMain,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.todos);
                  },
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomePageItem(
                  icon: Icons.school_outlined,
                  text: 'Improve IQ',
                  color: Colors.blue.shade900,
                ),
                HomePageItem(
                  icon: Icons.person_add_alt_1_outlined,
                  text: 'Profile  ',
                  color: AppColors.profileColor,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.profilePage);
                  },
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomePageItem(
                  icon: Icons.data_object_outlined,
                  text: 'History',
                  color: AppColors.historyPageColor,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.historyPage);
                  },
                ),
                HomePageItem(
                  icon: Icons.adobe_outlined,
                  text: 'About',
                  color: AppColors.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
