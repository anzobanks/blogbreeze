import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.child,
    this.backgroundColor,
    required this.onPress,
    this.radius
  });

  final Color? backgroundColor;
  final double? radius;
  final Widget child;
 final  Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 20))),
          backgroundColor:
              MaterialStatePropertyAll(backgroundColor ?? AppColors.main),
          surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
          shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        ),
        child: child,
      ),
    );
  }
}

class AppButtonOutlined extends StatelessWidget {
  AppButtonOutlined({
    super.key,
    required this.text,
    this.backgroundColor,
    required this.height,
    required this.width,
    required this.onPress,
  });
  final double height, width;
  final Color? backgroundColor;
  final Text text;
 final  Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.main,
          ),
          borderRadius: BorderRadius.circular(25)),
      child: OutlinedButton(
        onPressed: onPress,
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
            backgroundColor: MaterialStatePropertyAll(backgroundColor)),
        child: text,
      ),
    );
  }
}
