import 'package:flutter/material.dart';
import 'package:hestia_23/core/Constants..dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var cardHeight = h * 0.46;

    return Container(
      color: const Color(0xff1C1C1C),
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
                    // color: Colors.white,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "CULTURAL",
                        style: FutTheme.categoryFont
                            .copyWith(fontSize: cardHeight * 0.08),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    height: cardHeight * 0.6,
                    // color: Colors.yellow,
                    child: ClipPath(
                      clipBehavior: Clip.hardEdge,
                      clipper: CustomClipPath(),
                      child: const Image(
                        image: AssetImage(
                          "assets/images/Eventcategory1.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
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
              //  color: Colors.green,
              child: Text(
                "Learn from the finest of skills from the best of mentors at our curated workshops and skill sessions",
                style: FutTheme.font7.copyWith(
                    color: const Color.fromRGBO(255, 255, 255, 0.61),
                    fontSize: w * 0.03),
                textAlign: TextAlign.start,
              ),
            ),
          ),

          //TODO : need to make new clips for the check it out

          Expanded(
              flex: 5,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.only(left: w * 0.07),
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets/images/checkitout.png")),
              ))
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
