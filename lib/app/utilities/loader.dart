// Getx -- needs to be implemnted for loader

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  int initialData = 0;
  @override
  void initState() {
    super.initState();
  }

  Future<int> delayFn() async {
    await Future.delayed(const Duration(seconds: 30), () {
      setState(() {
        initialData = 1;
      });
    });
    return initialData;
  }

  @override
  void dispose() {
    super.dispose();
    initialData.ceil();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: 0,
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: Get.height / 2,
              width: Get.width,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Please wait its loading...'),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return SizedBox();
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.indigo,
                ),
              );
            }
          }
        },
        future: delayFn());
  }
}
