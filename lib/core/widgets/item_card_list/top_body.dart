import 'package:dashboard/core/theming/colors.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBody extends StatelessWidget {
  const TopBody({
    super.key,
    required this.item,
    required this.isFav,
    required this.toggleFav,
  });

  final Product item;
  final bool Function(Product p1) isFav;
  final Future<void> Function(Product p1) toggleFav;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.network(
              item.images![0],
              // width: 100.r,
              height: 165.r,
              fit: BoxFit.contain,
              // loadingBuilder: (context, loadingWidget, event) {
              //   return const CircularProgressIndicator();
              // },
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                icon: Icon(
                  isFav(item) ? Icons.favorite : Icons.favorite_outline,
                  color: isFav(item) ? ColorsManager.removeColor : null,
                  size: 25.sp,
                ),
                onPressed: () async => await toggleFav(item)),
          ),
        ],
      ),
    );
  }
}
