import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../models/blog.dart';

class MakeFavorite extends StatelessWidget {
  const MakeFavorite({
    super.key,
    required this.blog,
  });

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        blog.isFavorite.toggle();
      },
      child: Obx(() {
        return blog.isFavorite.value == true ? SvgPicture.asset(
            'assets/heartActive.svg',   color: 
               Colors.red)
                : SvgPicture.asset('assets/heart.svg',
            color: 
              Theme.of(context).cardColor);
      }),
    );
  }
}
