import 'package:get/get.dart';
import 'package:yelp/app/modules/home/provider/home_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(homeProvider: HomeProvider() ),
    );
  }
}
