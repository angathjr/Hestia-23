import 'package:flutter/material.dart';
import 'package:hestia_23/core/Constants..dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Column(
              children: [
                //The poster will be placed here

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: width,
                    height: height * 0.5,
                    child: Image.asset(
                      "assets/images/poster.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                //Event name and venue

                SizedBox(
                  height: height * 0.12,
                  width: width,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        "AGREE TO DISAGREE",
                        style:
                            FutTheme.font1.copyWith(fontSize: height * 0.028),
                      ),
                      Text(
                        "DEBATE COMPETITION",
                        style:
                            FutTheme.font2.copyWith(fontSize: height * 0.015),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: height * 0.02,
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text("APJ PARK",
                              style: FutTheme.font2.copyWith(
                                  fontSize: height * 0.012,
                                  color: const Color(0xff8C8984),
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      )
                    ],
                  ),
                ),

                //Reg fee  date and prize

                Container(
                  width: width,
                  height: height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xffD1D1D1)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Date",
                              style: FutTheme.font3
                                  .copyWith(fontSize: height * 0.014),
                            ),
                            Text(
                              "May 26",
                              style: FutTheme.font1.copyWith(
                                  fontSize: height * 0.018,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    const Color(0xffd1d1d1).withOpacity(0.7)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Prize",
                                  style: FutTheme.font3.copyWith(
                                      fontSize: height * 0.015,
                                      color: Colors.black),
                                ),
                                Text(
                                  "30 K",
                                  style: FutTheme.font1.copyWith(
                                      fontSize: height * 0.03,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Fee",
                                style: FutTheme.font3
                                    .copyWith(fontSize: height * 0.015),
                              ),
                              Text(
                                "500",
                                style: FutTheme.font1.copyWith(
                                    fontSize: height * 0.018,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ))
                    ],
                  ),


                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
