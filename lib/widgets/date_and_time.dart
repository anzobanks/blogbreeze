import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';

class DateAndTime extends StatelessWidget {
  DateAndTime({super.key, required this.text, required this.icon,this.iconSize, this.textSize});
  final String text, icon;
  final AppController appController = Get.find();
final double? textSize , iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
    
   SvgPicture.asset(icon,
            color: Theme.of(context).cardColor,
            height:iconSize?? 15)
     ,
      const SizedBox(width: 5),
      Text(text, style: TextStyle(fontSize:textSize?? 13))
    ]);
  }
}
