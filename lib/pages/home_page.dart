import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../controllers/blog_controller.dart';
import '../models/blog.dart';
import '../themes/app_colors.dart';
import '../widgets/blog_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final RxBool check = false.obs;
  final AppController appController = Get.find();
  final BlogController blogController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        // backgroundColor: AppColors.background,
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hi, VModel',
                              style: TextStyle(color: AppColors.grey)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Let's explore today",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 270,
                          child: FutureBuilder<List<Blog>>(
                              future: blogController.oneTimefetchBlogs(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data!.isEmpty) {
                                    return const Center(
                                      child: Text(
                                        'No task',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    );
                                  } else {
                                    return ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      // padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        return BlogTileH(
                                            appController: appController,
                                            blog: snapshot.data![index]);
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(
                                          width: 15,
                                        );
                                      },
                                      itemCount: snapshot.data!.length,
                                    );
                                  }
                                } else if (snapshot.hasError)
                                  return Center(
                                    child: Text(
                                      snapshot.error.toString(),
                                    ),
                                  );
                                else
                                  return const Center(
                                      child: CircularProgressIndicator());
                              })),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text('Popular News',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      Expanded(
                          child: GetBuilder<BlogController>(
                        init: BlogController(),
                        initState: (_) {},
                        builder: (controller) {
                          return FutureBuilder<List<Blog>>(
                              future: controller.oneTimefetchBlogs(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data!.isEmpty) {
                                    return const Center(
                                      child: Text(
                                        'No blogs to show',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    );
                                  } else {
                                    return ListView.separated(
                                      // reverse: true,
                                      shrinkWrap: true,
                                      // padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        return BlogTileV(
                                            appController: appController,
                                            blog: snapshot.data![index]);
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(
                                          height: 15,
                                        );
                                      },
                                      itemCount: snapshot.data!.length,
                                    );
                                  }
                                } else if (snapshot.hasError)
                                  return Center(
                                    child: Text(
                                      snapshot.error.toString(),
                                    ),
                                  );
                                else
                                  return const Center(
                                      child: CircularProgressIndicator());
                              });
                        },
                      )),
                    ],
                  )),
            ),
          ],
        )));
  }
}
