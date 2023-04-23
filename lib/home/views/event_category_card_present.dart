import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants..dart';
import '../../events/models/category.dart';

class Eventcardpresent extends StatelessWidget {
  const Eventcardpresent({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.black,
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: w * 0.03),
              decoration: BoxDecoration(
                  color: Colors.black, border: Border.all(color: Colors.white)),
              height: h * 0.30,
              width: w * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: SizedBox(
                      height: h * 0.13,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Cultural",
                      style: TextStyle(
                          fontSize: w * 0.05,
                          color: Colors.white,
                          inherit: false),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: h * 0.015,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: h * 0.0070,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/diagrect.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: h * 0.02,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: w * 0.40,
                      child: Text(
                          style: TextStyle(
                              inherit: false,
                              fontSize: w * 0.02,
                              color: Colors.white),
                          "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et"),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: h * 0.02,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow),
                        child: Text(
                          categoryModel.name,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox())
                ],
              ),
            ),
            Positioned(
                bottom: h * 0.20,
                child: SizedBox(
                  height: h * 0.2,
                  width: w * 0.45,
                  child: CachedNetworkImage(
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              context.theme.disabledColor),
                          value: downloadProgress.progress),
                    ),
                    imageUrl: categoryModel.imgUrl,
                    fit: BoxFit.cover,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
