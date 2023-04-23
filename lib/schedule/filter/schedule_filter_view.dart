import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: ElevatedButton(
              onPressed: () {
                //This Goes Under filter Button............

                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) => Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(w * 0.03),
                                  topLeft: Radius.circular(w * 0.03))),
                          child: FractionallySizedBox(
                            heightFactor: 0.75,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: w * 0.09, right: w * 0.09),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text("Filter"),
                                  ),
                                  SizedBox(
                                    height: h * 0.05,
                                  ),
                                  const Text("Filter by Category"),
                                  SizedBox(
                                    height: h * 0.015,
                                  ),
                                  SizedBox(
                                    height: h * 0.2,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder: ((context, index) {
                                          return const FilterListWidget();
                                        })),
                                  ),
                                  SizedBox(
                                    height: h * 0.024,
                                  ),
                                  const Text("Filter by Category"),
                                  SizedBox(
                                    height: h * 0.015,
                                  ),
                                  SizedBox(
                                    height: h * 0.2,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder: ((context, index) {
                                          return const FilterListWidget();
                                        })),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
              },
              child: const Text("show model bottom sheet"))),
    );
  }
}

//Single Category widget

class FilterListWidget extends StatelessWidget {
  const FilterListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: w * 0.04),
          height: h * 0.1,
          width: w * 0.3,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Eventcategory1.png"),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: h * 0.015,
        ),
        const Text("Workshop")
      ],
    );
  }
}
