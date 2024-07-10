import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class SplashscreenPage extends StatelessWidget {
const SplashscreenPage({super.key});

@override
Widget build(BuildContext context) {
double width = MediaQuery.of(context).size.width;
double height = MediaQuery.of(context).size.height;
  return Scaffold(
      body:
          Container(
           height:height,
           width: width,
           padding: const EdgeInsets.all(50),
          decoration:  BoxDecoration(
            color:Theme.of(context).primaryColor,
         
          ),
           child:FadeIn(
                        duration: 1000.milliseconds,
            
            child: SvgPicture.asset('assets/logolight.svg',
                            height: 50,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color)),

          ),
   
    );
}
}
