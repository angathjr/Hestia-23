// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hestia_23/core/Constants..dart';
import 'package:hestia_23/events/models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var cardHeight = h * 0.46;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
      ),
      child: Column(
        children: [
          SizedBox(
            height: cardHeight * 0.6,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        categoryModel.name,
                        style: FutTheme.categoryFont
                            .copyWith(fontSize: cardHeight * 0.067),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: SizedBox(
                    height: cardHeight * 0.6,
                    child: ClipPath(
                        clipBehavior: Clip.hardEdge,
                        clipper: CustomClipPath(),
                        child: CachedNetworkImage(
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    FutTheme.primaryColor),
                                value: downloadProgress.progress),
                          ),
                          imageUrl: categoryModel.imgUrl,
                          fit: BoxFit.cover,
                        )),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(w * 0.08, 0, 0, 0),
              child: Text(
                "Learn from the finest of skills from the best of mentors at our curated workshops and skill sessions",
                style: FutTheme.font7.copyWith(
                    color: const Color.fromRGBO(255, 255, 255, 0.61),
                    fontSize: w * 0.03),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                  padding: EdgeInsets.only(left: w * 0.07),
                  alignment: Alignment.centerLeft,
                  child: Image.asset("assets/images/checkitout.png")))
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final Path path = Path();
    path.lineTo(0, h * 0.8);
    path.lineTo(w * 0.25, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final Path path = Path();
    path.lineTo(0, h);
    path.lineTo(w * 0.80, h);
    path.lineTo(w, h * 0.5);
    path.lineTo(w, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
