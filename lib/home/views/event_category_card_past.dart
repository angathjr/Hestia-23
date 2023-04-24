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
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
          height: cardHeight,
          width: w * 0.7,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: cardHeight * 0.45,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.theme.primaryColor,
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(30),
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: context.theme.primaryColor),
                    color: const Color.fromARGB(255, 44, 44, 40),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  height: cardHeight * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: cardHeight * 0.05,
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                            child: Text(
                              categoryModel.name,
                              style:
                                  context.theme.textTheme.titleLarge?.copyWith(
                                fontSize: cardHeight * 0.067,
                                color: context.theme.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: cardHeight * 0.01,
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          child: Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.05),
                              child: Text(
                                categoryModel.description,
                                style: FutTheme.font7.copyWith(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w800,
                                    fontSize: w * 0.03),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: cardHeight * 0.05,
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
                      SizedBox(
                        height: cardHeight * 0.07,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
