import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';


showLoading(BuildContext context) async {
  OverlayState? overlayState = Overlay.of(context);

  overlayState.insert(overlayEntry);
}

Widget buildLoading(context) {

  return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color:Colors.black.withOpacity(0.5),
      ),
      child: Lottie.asset('assets/loading.json',height: 20,width:20));
}

OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
  return buildLoading(context);
});
