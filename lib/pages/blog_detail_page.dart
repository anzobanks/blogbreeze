import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../models/blog.dart';
import '../themes/app_colors.dart';
import '../widgets/date_and_time.dart';
import '../widgets/make_favorite.dart';

class BlogDetailPage extends StatelessWidget {
  BlogDetailPage({super.key, required this.blog});
  final AppController appController = Get.find();
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            height: height,
            width: width,
            child: Column(children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  height: height / 3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(blog.image),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3),
                          BlendMode.darken,
                        ),
                      )),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF7b848b).withOpacity(0.5),
                                  shape: BoxShape.circle),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                ),
                                color: AppColors.white,
                                onPressed: () {
                                  Get.back();
                                },
                                style: IconButton.styleFrom(
                                    backgroundColor: AppColors.main),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF7b848b).withOpacity(0.5),
                                  shape: BoxShape.circle),
                              child: IconButton(
                                icon: SvgPicture.asset('assets/share.svg',
                                    color: AppColors.white),
                                onPressed: () {},
                              ),
                            ),
                          ]),
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(blog.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.white)),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DateAndTime(
                                      iconSize: 18,
                                      textSize: 16,
                                      icon: 'assets/calendar.svg',
                                      text: appController
                                          .formatDate(blog.dateCreated)),
                                  const SizedBox(width: 8),
                                  CircleAvatar(
                                      backgroundColor:
                                          Theme.of(context).cardColor,
                                      radius: 3),
                                  const SizedBox(width: 8),
                                  DateAndTime(
                                      iconSize: 18,
                                      textSize: 16,
                                      icon: 'assets/timer.svg',
                                      text: '1 hour'),
                                ],
                              )
                            ]),
                      )
                    ],
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            constraints: const BoxConstraints(maxWidth: 220),
                            child: Text(blog.subTitle,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  const Color(0xFF7b848b).withOpacity(0.5),
                              child: MakeFavorite(
                                blog: blog,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: SingleChildScrollView(child: Text(blog.body))),
                    ],
                  ),
                ),
              )
            ])),
      ),
    );
  }
}
