import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yelp/app/modules/home/model/home_model.dart';
import 'package:yelp/app/utilities/util.dart';

class HomeRepository {
  final dio = Dio();
  Utility utility = Utility();
  Future<YelpModel> yelpGett() async {
    YelpModel sample = YelpModel();

    try {
      Response r = await dio.get(
          'https://api.yelp.com/v3/businesses/search?location=NYC',
          // headers: <String, String>{'authorization': basicAuth});
          options: Options(headers: {
            "authorization":
                'Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx'
          }));

      Map<String, dynamic> valueMap = r.data;
      try {
        sample = YelpModel.fromJson((valueMap as Map).cast());
      } catch (e) {
        sample = YelpModel();
      }
    } catch (e) {
      utility.toastMessage(
          "Network check", "Please check internet connection", Colors.red);
    }

    // developer.log(valueMap.toString());
    return sample;
    // printWrapped(jsonDecode(r.data));
    // Save your token here
  }
}
