import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../controllers/blog_controller.dart';
import '../models/blog.dart';

import '../widgets/blog_tile.dart';

class FavoriteBlogPage extends StatelessWidget {
  FavoriteBlogPage({super.key});
  final AppController appController = Get.find();
  final BlogController blogController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("My favorite article",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SvgPicture.asset(
                    'assets/heartActive.svg',
                    color: Colors.red,
                    height: 40,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
               TextFormField(
                // controller: wallpaperController.searchController,
                decoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        // wallpaperController.searchController.clear();
                        // defaultLogWriterCallback(
                        //     wallpaperController.searchController.text);
                      },
                    )),
                onChanged: (value) {
                  blogController.search.value = value;
                  // defaultLogWriterCallback(
                  //     wallpaperController.searchKey.value);
                },
              ),
              const SizedBox(
                height: 20,
              ),
                 Expanded(child: GetBuilder<BlogController>(
                builder: (controller) {
                  return Obx(() {
                    return FutureBuilder<List<Blog>>(
                        future: blogController
                            .searchBlogs(controller.search.value),
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
                  });
                },
              )),
            ],
          )),
    ));
  }
}
