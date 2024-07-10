import 'package:blogbreeze/pages/creupdate_blog_page.dart';
import 'package:blogbreeze/pages/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../themes/app_colors.dart';
import '../widgets/nav_element.dart';
import 'account_page.dart';
import 'home_page.dart';
import 'search_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final pageController = PageController();
  final RxInt selectedIndex = 0.obs;
  final AppController appController = Get.find();

  final RxInt selectedColor = 0.obs;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                Obx(() {
                  return Center(
                    child: selectedIndex.value == 3
                        ? Container()
                        : SvgPicture.asset('assets/logolight.svg',
                            height: 50,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color),
                  );
                }),
                Expanded(
                  child: GetBuilder<AppController>(
                    init: AppController(),
                    initState: (_) {},
                    builder: (controller) {
                      return FutureBuilder<bool>(
                          future: controller.checkNetwork(),
                          builder: (context, snapshot) {
                            if (snapshot.data == false)
                              return const Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.wifi_off_rounded),
                                  Text('Please check your network'),
                                ],
                              ));
                            else
                              return PageView(
                                  controller: pageController,
                                  onPageChanged: (index) {
                                    defaultLogWriterCallback(index.toString());
                                    selectedIndex.value = index;
                                  },
                                  children: [
                                    HomePage(),
                                    SearchPage(),
                                    FavoriteBlogPage(),
                                    AccountPage()
                                  ]);
                          });
                    },
                  ),
                ),
              ],
            )),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: 20,
        ),
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              spreadRadius: 8,
              blurRadius: 13,
              offset: Offset(0, -10), // Position de l'ombre
            ),
          ],
          color: Theme.of(context).primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                NavbarElement(
                  icon: 'assets/home.svg',
                  iconActive: 'assets/homeActive.svg',
                  selectedIndex: selectedIndex,
                  index: 0,
                  pageController: pageController,
                  title: 'Home',
                ),
                SizedBox(width: 50),
                NavbarElement(
                  selectedIndex: selectedIndex,
                  icon: 'assets/search.svg',
                  iconActive: 'assets/searchActive.svg',
                  index: 1,
                  pageController: pageController,
                  title: 'Search',
                ),
              ],
            ),
            Row(
              children: [
                NavbarElement(
                  selectedIndex: selectedIndex,
                  icon: 'assets/favorite.svg',
                  iconActive: 'assets/favoriteActive.svg',
                  index: 2,
                  pageController: pageController,
                  title: 'Favorite',
                ),
                SizedBox(width: 50),
                NavbarElement(
                  selectedIndex: selectedIndex,
                  icon: 'assets/profile.svg',
                  iconActive: 'assets/profileActive.svg',
                  index: 3,
                  pageController: pageController,
                  title: 'Account',
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.button,
          onPressed: () {
            Get.to(() => CreupdateBlogPage(
                  action: 'Create',
                ));
          },
          child: const Icon(Icons.add, color: AppColors.white)),
    );
  }
}
