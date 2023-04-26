import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:hestia_23/events/views/events_screen.dart';

import '../../core/constants..dart';
import '../../events/models/category.dart';

class CategoryCardPresent extends StatelessWidget {
  CategoryCardPresent({super.key, required this.categoryModel});

  final CategoryModel categoryModel;
  final EventsController eventController = Get.find();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var cardHeight = h * 0.5;

    return Align(
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: h * 0.05),
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      color: context.theme.primaryColor,
                      spreadRadius: 1)
                ],
                color: Colors.black,
                border: Border.all(
                    color: context.theme.primaryColor.withOpacity(0.8))),
            height: cardHeight,
            width: w * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 7,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    categoryModel.name,
                    style: context.theme.textTheme.titleLarge
                        ?.copyWith(fontSize: cardHeight * 0.067),
                  ),
                ),
                Container(
                  height: 5,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/presentLine.png"),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: h * 0.015,
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: w * 0.40,
                    child: Text(
                      categoryModel.description,
                      style: FutTheme.font7.copyWith(
                          color: const Color.fromRGBO(255, 255, 255, 0.61),
                          fontSize: w * 0.03),
                      textAlign: TextAlign.start,
                    ),
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: context.theme.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          "Check It Out",
                          style: context.theme.textTheme.titleSmall
                              ?.copyWith(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox())
              ],
            ),
          ),
          Positioned(
              top: 0,
              child: Container(
                height: h * 0.2,
                width: w * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  //border: Border.all(color: context.theme.primaryColor)
                ),
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation(context.theme.disabledColor),
                        value: downloadProgress.progress),
                  ),
                  imageUrl: categoryModel.imgUrl,
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    );
  }
}
