import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import '../../core/constants..dart';
import '../../events/models/category.dart';

class CategoryCardPast extends StatelessWidget {
  CategoryCardPast({super.key, required this.categoryModel});

  final CategoryModel categoryModel;
  final EventsController eventController = Get.find();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var cardHeight = h * 0.5;

    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red.shade400,
            border: Border.all(color: context.theme.primaryColor, width: 5),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        height: cardHeight,
        width: w * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: SizedBox(
                  height: cardHeight * 0.4,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(
                            color: context.theme.primaryColor, width: 3)),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
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
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: Text(
                    categoryModel.name,
                    style: context.theme.textTheme.titleLarge?.copyWith(
                      fontSize: cardHeight * 0.067,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                    child: Text(
                      categoryModel.description,
                      style: FutTheme.font7.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: w * 0.03),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                  margin: EdgeInsets.symmetric(horizontal: w * 0.05),
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
    );
  }
}
