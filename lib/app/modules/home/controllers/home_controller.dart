import 'package:get/get.dart';
import 'package:yelp/app/modules/home/model/home_model.dart';
import 'package:yelp/app/modules/home/provider/home_provider.dart';

class HomeController extends GetxController {
  late HomeProvider homeProvider = HomeProvider();
  HomeController({homeProvider});
  Rx<YelpModel> yelpModel = YelpModel().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await function();
  }

  Future<void> function() async {
    await homeProvider.yelpGet().then((onValue) {
      yelpModel.value = onValue;
    });
  }
}
