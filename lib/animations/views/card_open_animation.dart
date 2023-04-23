import 'dart:async';
import 'package:flutter/material.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleController =
        AnimationController(vsync: this, duration:const  Duration(milliseconds: 500))
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                Navigator.push(
                  context,
                  AnimatingRoute(
                    route: Destination(), page: Destination(),
                  ),
                );
                Timer(
                  const Duration(milliseconds: 300),
                  () {
                  
                    scaleController.reset();
                  },
                );
              }
            },
          );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 10.0).animate(scaleController);
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            scaleController.forward();
          },
          child: Container(
            width: 100,
            height: 100,
            decoration:const  BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: AnimatedBuilder(
              animation: scaleAnimation,
              builder: (c, child) => Transform.scale(
                scale: scaleAnimation.value,
                child: Container(
                  decoration:const  BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Go Back'),
      ),
    );
  }
}

class AnimatingRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  AnimatingRoute({required this.page, required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}
