import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../themes/app_colors.dart';

class NavbarElement extends StatelessWidget {
  NavbarElement(
      {super.key,
      required this.selectedIndex,
      required this.icon,
      required this.iconActive,

      required this.title,
      required this.index,
      required this.pageController});
  final String icon,iconActive;
  final RxInt selectedIndex;
  final int index;
  final String title;
  final AppController appController = Get.find();

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedIndex.value = index;
        pageController.jumpToPage(selectedIndex.value);
      },
      child: Obx(() {
        return Column(
          children: [
            SvgPicture.asset(selectedIndex.value == index
                    ?iconActive:icon,height: 25,
                color: selectedIndex.value == index
                    ? Theme.of(context).textTheme.bodyMedium!.color
                    : AppColors.grey),
            const SizedBox(height: 5),
            selectedIndex.value == index
                ? FadeInUp(
                  duration: 200.milliseconds,
                  child: CircleAvatar(
                    radius:3,
                    backgroundColor:Theme.of(context).textTheme.bodyMedium!.color,),
                )
                : Container(),
          ],
        );
      }),
    );
  }
}

