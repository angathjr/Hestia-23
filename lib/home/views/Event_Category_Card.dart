import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardEvents extends StatelessWidget {
  const CardEvents({
    super.key,
    required this.cardh,
    required this.cardw,
    required this.w,
    required this.imgurl,
    required this.eventcat,
  });

  final double cardh;
  final double cardw;
  final double w;
  final String imgurl;
  final String eventcat;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardh,
      width: cardw,
      child: SingleChildScrollView(
        child: Card(
            color: const Color(0xff2C2C2C),
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: EdgeInsets.only(left: cardw * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: cardh * 0.63,
                        width: cardw * 0.12,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            "  $eventcat\n",
                            style: TextStyle(
                                color: Colors.white, fontSize: 0.05 * w),
                          ),
                        ),
                      ),
                      ClipPath(
                        clipBehavior: Clip.hardEdge,
                        clipper: CustomClippath(),
                        child: SizedBox(
                          width: cardw * 0.77,
                          height: cardh * 0.63,
                          child: Image(
                            image: AssetImage(imgurl),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: cardh * 0.026,
                  ),
                  Text(
                    "Learn from the finest of skills from the best\nof mentors at our curated workshops\nand skill sessions",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.61),
                        fontSize: cardw * 0.04),
                  ),
                  SizedBox(
                    height: cardh * 0.042,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipPath(
                          clipper: CustomClippath2(),
                          child: Container(
                              width: cardw * 0.62,
                              height: 0.072 * cardh,
                              decoration:
                                  BoxDecoration(color: Color(0xffD9D9D9)))),
                      ClipPath(
                          clipper: CustomClippath2(),
                          child: Container(
                              width: cardw * 0.61,
                              height: 0.071 * cardh,
                              decoration:
                                  BoxDecoration(color: Color(0xff2C2C2C)))),
                      ClipPath(
                        clipper: CustomClippath2(),
                        child: SizedBox(
                          height: 0.059 * cardh,
                          width: cardw * 0.58,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffDEFD72),
                                shape: RoundedRectangleBorder()),
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                "CHECK IT OUT",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: cardw * 0.05),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: cardh * 0.042,
                    child: Container(
                      color: Color(0xff2C2C2C),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class CustomClippath extends CustomClipper<Path> {
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final Path path = Path();
    path.lineTo(0, h * 0.785);
    path.lineTo(w * 0.25, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CustomClippath2 extends CustomClipper<Path> {
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
