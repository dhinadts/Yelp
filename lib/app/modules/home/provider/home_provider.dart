import 'package:yelp/app/modules/home/controllers/home_controller.dart';
import 'package:yelp/app/modules/home/model/home_model.dart';
import 'package:yelp/app/modules/home/repository/home_repo.dart';

class HomeProvider extends HomeController {
  HomeRepository repo = HomeRepository();
  Future<YelpModel> yelpGet() async => await repo.yelpGett();
}
