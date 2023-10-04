import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          '',
          // 'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(height: 200.h),
            ProfileBodyItem(text: 'Abror Shamuradov', icons: Icons.person),
            ProfileBodyItem(text: 'Birthday', icons: Icons.calendar_month),
            ProfileBodyItem(text: 'Phone', icons: Icons.phone),
            ProfileBodyItem(text: 'Email', icons: Icons.email),
            ProfileBodyItem(text: 'Facebook account', icons: Icons.facebook),
          ],
        ),
        Positioned(
          top: 113.h,
          child: Container(
            padding: EdgeInsets.all(2.h),
            height: 90.h,
            width: 90.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
            ),
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 130,
            ),
          ),
        ),
        Positioned(
          top: 0.h,
          child: Container(
            padding: EdgeInsets.all(2.h),
            height: 90.h,
            width: 300.w,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(25.r),
            ),
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
}

class ProfileBodyItem extends StatelessWidget {
  final IconData icons;
  final String text;

  const ProfileBodyItem({
    Key? key,
    required this.icons,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(icons),
                  SizedBox(width: 30.w),
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
