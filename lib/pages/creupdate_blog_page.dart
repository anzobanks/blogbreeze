import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../controllers/blog_controller.dart';


class CreupdateBlogPage extends StatelessWidget {
  CreupdateBlogPage({super.key, required this.action});
  final AppController appController = Get.find();
  final BlogController blogController = Get.find();
  final String action;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          height: height,
          width: width,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Cancel'),
                ),
                Text(action,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                MaterialButton(
                  onPressed: () {
                    if (blogController.blogKey.currentState!.validate()) {
                      if (action == 'Create')
                        appController
                            .performAction(blogController.createBlog(context));
                      else
                        appController
                            .performAction(blogController.updateBlogPost(
                          context,
                        ));
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: blogController.blogKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        maxLength: 60,
                        validator: appController.validateForm,
                        controller: blogController.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        decoration: InputDecoration(labelText: 'Title'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: blogController.subTitle,
                        validator: appController.validateForm,
                        style: TextStyle(fontWeight: FontWeight.w400),
                        maxLines: 2,
                        decoration: InputDecoration(labelText: 'Subtitle'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: blogController.blogBody,
                        validator: appController.validateForm,
                        maxLines: 20,
                        decoration: InputDecoration(
                            labelStyle:
                                TextStyle(color: Theme.of(context).cardColor),
                            labelText: 'Content'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
