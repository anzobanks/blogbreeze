import 'package:get/get.dart';

import '../controllers/blog_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {

    Get.put(BlogController());
  }
}
