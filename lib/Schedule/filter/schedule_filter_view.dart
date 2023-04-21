import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return Container(
              child: Column(
                children: [
                  Text("Filter by Category"),
                  ListView.builder(
                      itemCount: 5,
                      itemBuilder: ((context, index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/Eventcategory1.png"),
                                          fit: BoxFit.cover)),
                                ),
                              )
                            ],
                          ),
                        );
                      }))
                ],
              ),
            );
          }),
    );
  }
}
