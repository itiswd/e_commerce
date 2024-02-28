import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class ImageAndBack extends StatelessWidget {
  const ImageAndBack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 160,
            color: AppColor.primaryColor,
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: -60,
            child: Align(
              child: CircleAvatar(
                radius: 64,
                backgroundColor: AppColor.primaryColorDark,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Image.asset(
                      'assets/images/me3.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
