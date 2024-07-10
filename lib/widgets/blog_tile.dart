import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../models/blog.dart';
import '../pages/blog_detail_page.dart';
import '../themes/app_colors.dart';
import 'menu_button.dart';
import 'date_and_time.dart';
import 'make_favorite.dart';

class BlogTileV extends StatelessWidget {
  const BlogTileV({super.key, required this.appController, required this.blog});
  final Blog blog;

  final AppController appController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { 
        Get.to(()=>BlogDetailPage(blog: blog));
       },
      child: Container(

          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                                   constraints: BoxConstraints(maxWidth:200 ),

                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(blog.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(blog.subTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.grey))
                  ]),
                ),
                Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(blog.image),
                            fit: BoxFit.cover))),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    DateAndTime(
                        icon: 'assets/calendar.svg',
                        text: appController.formatDate(blog.dateCreated)),
                    const SizedBox(width: 8),
                CircleAvatar(
                          backgroundColor:Theme.of(context).cardColor,
                          radius: 3),
                    const SizedBox(width: 8),
                    DateAndTime(
                        icon: 'assets/timer.svg',
                        text: '${Random().nextInt(images.length)} min'),
                  ],
                ),
                Row(
                  children: [
                    MakeFavorite(blog: blog),
                    const SizedBox(width: 8),
                 SvgPicture.asset('assets/share.svg',
                        color: Theme.of(context).cardColor)   ,
                    const SizedBox(width: 8),
                    MenuButton(blog:blog)
                  ],
                )
              ],
            )
          ])),
    );
  }
}


class BlogTileH extends StatelessWidget {
  const BlogTileH({super.key, required this.appController, required this.blog});

  final AppController appController;
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child:InkWell(
      onTap: () { 
        Get.to(()=>BlogDetailPage(blog: blog));
       },
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                    height: 150,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(blog.image),
                            fit: BoxFit.cover))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF7b848b).withOpacity(0.5),
                      child:                   MakeFavorite(blog: blog),
        ),
                ),
              ],
            ),
            Container(
                
        
                width:220,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(blog.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                     Text(blog.subTitle,
                          maxLines: 1,
                          style: TextStyle(color: AppColors.grey,                     
                          overflow: TextOverflow.ellipsis,)),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DateAndTime(
                              icon: 'assets/calendar.svg', text: appController.formatDate(blog.dateCreated)),
                    CircleAvatar(
                                backgroundColor:
                                   Theme.of(context).cardColor,
                                radius: 3)
                        ,
                          DateAndTime(icon: 'assets/timer.svg', text: '${Random().nextInt(images.length)} min'),
                        ],
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
