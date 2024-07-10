import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../themes/app_colors.dart';

class ProfilTile extends StatelessWidget {
  ProfilTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});
  final IconData icon;
  final String title;
  final void Function()? onTap;
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child:  Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
           
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
             
              title: Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                  color: AppColors.grey),
              leading: Icon(icon, color:Theme.of(context).cardColor,)),
        ),
    );
  }
}
