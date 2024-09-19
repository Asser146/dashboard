import 'package:dashboard/core/widgets/card_skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkeletonList extends StatelessWidget {
  const SkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 5.h,
          childAspectRatio: 0.7,
        ),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return const CardSkeleton();
        },
      ),
    );
  }
}
