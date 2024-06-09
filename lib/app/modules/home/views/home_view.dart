import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yelp/app/modules/home/model/home_model.dart';
import 'package:yelp/app/utilities/app_style.dart';
import 'package:yelp/app/utilities/loader.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  Widget product(Businesses business) {
    return InkWell(
      onTap: () async {
        showModalBottomSheet(
            context: Get.context!,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            builder: (BuildContext context) {
              // return your layout
              return Container(
                height: Get.height * 0.5,
                padding: const EdgeInsets.all(5),
                color: Colors.white10,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(business.name!, style: AppTextStyles().medium03),
                    SizedBox(height: 5),
                    Text(business.id!, style: AppTextStyles().medium02),
                    SizedBox(height: 5),
                    Text(business.price!, style: AppTextStyles().medium02),
                    SizedBox(height: 5),
                    Text(business.alias!, style: AppTextStyles().medium02),
                    SizedBox(height: 5),
                    Text(business.displayPhone!,
                        style: AppTextStyles().medium02),
                    SizedBox(height: 5),
                    Text(business.location!.city!,
                        style: AppTextStyles().medium02),
                    SizedBox(height: 5),
                    Text(business.location!.address1!,
                        style: AppTextStyles().medium02),
                    SizedBox(height: 5),
                    Text("Rating: ${business.rating!.toString()}",
                        style: AppTextStyles().medium02),
                    SizedBox(height: 5),
                    Text("Review Count: ${business.reviewCount!} ",
                        style: AppTextStyles().medium02),
                    SizedBox(height: 5),
                    Text(business.transactions!.toString(),
                        style: AppTextStyles().medium02),
                    SizedBox(height: 5),
                    Text("Distance: ${business.distance!}",
                        style: AppTextStyles().medium02),
                    SizedBox(height: 5),
                    Text("Is Closed: ${business.isClosed!}",
                        style: AppTextStyles().medium03.copyWith(
                            color: business.isClosed!
                                ? Colors.red
                                : Colors.green)),
                    SizedBox(height: 5),
                  ],
                ),
              );
            });
      },
      child: SizedBox(
        width: Get.width * 0.25,
        height: Get.height * 0.7,
        child: Column(
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    width: Get.width * 0.2,
                    height: Get.height * 0.07,
                    child: Image.network(
                      business.imageUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(business.name!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Obx(
                () => controller.yelpModel.value.businesses == null
                    ? const Loader()
                    : GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        children: List.generate(
                            controller.yelpModel.value.businesses!.length,
                            (index) {
                          return product(
                              controller.yelpModel.value.businesses![index]);
                        }),
                      ),
              ))
            ],
          ),
        ));
  }
}
