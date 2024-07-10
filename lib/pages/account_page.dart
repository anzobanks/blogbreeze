import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';

import '../widgets/profil_tile.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      body: SafeArea(
     
        child: SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
              Container(
                    height: height / 3,
                    padding: const EdgeInsets.all(30),
                    width: width,
                    decoration: BoxDecoration(
                      
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Account',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                shadows: [
                                  Shadow(
                                      color: Color.fromARGB(255, 161, 160, 160),
                                      blurRadius: 1,
                                      offset: Offset(2.0, 2.0))
                                ])),
                        Column(
                          children: [
                            const CircleAvatar(
                                radius: 45,
                                child: Icon(
                                  FontAwesomeIcons.user,
                                  size: 30,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('BANKOLE Kanzou-llohi',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('bankanzou2001@gmail.com',
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.blueGrey)),
                          ],
                        )
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    children: [
                      ProfilTile(
                        icon: FontAwesomeIcons.userPen,
                        title: 'Profile',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SwitchListTile(
                            title: Text(
                                appController.appMode.value == false
                                    ? 'Dark theme'
                                    : 'Light Theme',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            secondary: appController.appMode.value == false
                                ? Icon(
                                    Icons.dark_mode_rounded,
                                    color: Theme.of(context).cardColor,
                                  )
                                : Icon(Icons.light_mode_rounded,
                                    color: Theme.of(context).cardColor),
                            value: appController.appMode.value,
                            onChanged: (bool value) {
                              appController.changeTheme();
                            },
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      ProfilTile(
                        icon: Icons.settings,
                        title: 'Settings',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ProfilTile(
                        icon: Icons.help_outline_rounded,
                        title: 'Help and Support',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text('Blogbreeze v1.0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.blueGrey)),
                              
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
