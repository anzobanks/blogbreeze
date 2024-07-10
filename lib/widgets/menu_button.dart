import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../controllers/blog_controller.dart';
import '../models/blog.dart';
import '../pages/creupdate_blog_page.dart';
import '../themes/app_colors.dart';

class MenuButton extends StatelessWidget {
MenuButton({
    super.key,required this.blog
  });
  final AppController appController = Get.find();
  final BlogController blogController = Get.find();

final Blog blog;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<
            int>(
        child: SvgPicture.asset(
            'assets/menu.svg',
             color: Theme.of(context).cardColor),
        style: ElevatedButton
            .styleFrom(
                padding: EdgeInsets
                    .zero),
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(
                    15)),
        iconColor:
            AppColors
                .grey,
        onSelected: (int
            result) {
          switch (
              result) {
            case 1:
            blogController .getInfo(blog);
            Get.to(() => CreupdateBlogPage(action: 'Update',));

            break;
            case 2:
            blogController.deleteBlogPost(context, blog);
            break;
          }
        },
        itemBuilder: (BuildContext
                context) =>
            <PopupMenuEntry<
                int>>[
              const PopupMenuItem<
                  int>(
                value:
                    1,
                child:
                    Row(
                  children: [
                    Icon(Icons.edit,
                        color: AppColors.grey,
                        size: 20),
                    SizedBox(width: 5),
                    Text(
                      'Update',
                      style: TextStyle(fontSize: 14, color: AppColors.grey),
                    ),
                  ],
                ),
              ),
              const PopupMenuItem<
                  int>(
                value:
                    2,
                child:
                    Row(
                  children: [
                    Icon(Icons.delete,
                        color: Colors.red,
                        size: 20),
                    SizedBox(width: 5),
                    Text(
                      'Delete',
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  ],
                ),
              )
            ]);
  }
}

