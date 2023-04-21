import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideTransition extends CustomTransition {
  SideTransition() : super();

  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    alignment = Alignment.centerLeft;
    animation = CurvedAnimation(
      curve: Curves.fastLinearToSlowEaseIn,
      parent: animation,
      reverseCurve: Curves.fastOutSlowIn,
    );
    return Align(
      child: SizeTransition(
        axis: Axis.horizontal,
        sizeFactor: animation,
        axisAlignment: 0,
        child: child,
      ),
    );
  }
}

// class SizeTransition5 extends PageRouteBuilder {
//   final Widget page;

//   SizeTransition5(this.page)
//       : super(
//           pageBuilder: (context, animation, anotherAnimation) => page,
//           transitionDuration: Duration(milliseconds: 1000),
//           reverseTransitionDuration: Duration(milliseconds: 200),
//           transitionsBuilder: (context, animation, anotherAnimation, child) {
//             animation = CurvedAnimation(
//                 curve: Curves.fastLinearToSlowEaseIn,
//                 parent: animation,
//                 reverseCurve: Curves.fastOutSlowIn);
//             return Align(
//               alignment: Alignment.centerRight,
//               child: SizeTransition(
//                 axis: Axis.horizontal,
//                 sizeFactor: animation,
//                 child: page,
//                 axisAlignment: 0,
//               ),
//             );
//           },
//         );
// }
