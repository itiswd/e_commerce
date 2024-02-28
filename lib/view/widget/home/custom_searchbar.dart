import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchBar extends StatelessWidget {
  final String hint;
  final void Function() onTapNotify;
  final void Function()? onTapSearchIcon;
  final void Function()? onTapFavorite;
  final void Function(String)? onChange;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController controller;
  final bool favExist;
  const CustomSearchBar({
    super.key,
    required this.hint,
    this.onTapSearchIcon,
    required this.onTapNotify,
    required this.onTapFavorite,
    required this.favExist,
    this.onChange,
    required this.controller,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, right: 16, left: 16),
      child: SizedBox(
        height: 48,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                onChanged: onChange,
                onFieldSubmitted: (value) {
                  if (value != '') {
                    onFieldSubmitted;
                  }
                },
                cursorHeight: 22,
                style: Get.textTheme.bodyLarge!.copyWith(
                  color: AppColor.black,
                  height: 1.33,
                ),
                decoration: InputDecoration(
                  prefixIcon: GestureDetector(
                      onTap: onTapSearchIcon,
                      child: const Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                  hintText: hint,
                  hintStyle: Get.textTheme.bodyLarge!.copyWith(
                    color: AppColor.grey,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: GestureDetector(
                  onTap: onTapNotify,
                  child: const Icon(
                    Icons.notifications_active_outlined,
                    size: 28,
                  ),
                ),
              ),
            ),
            Visibility(
              child: favExist == true
                  ? Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: GestureDetector(
                              onTap: onTapFavorite,
                              child: const Icon(
                                Icons.favorite_outline_outlined,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
