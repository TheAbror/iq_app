import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnwerItem extends StatelessWidget {
  final String letter;
  final String text;
  final VoidCallback? onTap;

  const AnwerItem({
    Key? key,
    required this.letter,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 15.h),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            Text(
              letter,
              style: TextStyle(fontSize: 24.sp),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 24.sp),
            ),
          ],
        ),
      ),
    );
  }
}
