import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final String date;
  final String order;
  const NotificationCard({
    super.key,
    required this.title,
    required this.body,
    required this.date,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
      child: Card(
        color: AppColor.white,
        surfaceTintColor: AppColor.white,
        margin: const EdgeInsets.all(0.0),
        child: ListTile(
          leading: CircleAvatar(
            child: Center(
                child: Text(
              order,
              style: const TextStyle(fontFamily: 'BigVesta'),
            )),
          ),
          title: Row(
            children: [
              Text(
                title,
                style: Get.textTheme.displayLarge,
              ),
              const Spacer(),
              Text(
                Jiffy.parse(date).fromNow(),
                style: TextStyle(
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontFamily: 'BigVesta',
                ),
              )
            ],
          ),
          subtitle: Text(
            body,
            style: Get.textTheme.bodyLarge!.copyWith(
              color: AppColor.greyDark,
            ),
          ),
        ),
      ),
    );
  }
}
