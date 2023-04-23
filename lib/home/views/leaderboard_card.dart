import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:get/get.dart';
import 'package:hestia_23/theme/model/themes.dart';
import '../../core/Constants..dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  //leaderboard widget-future theme
  static Widget futureLeaderboard(num h, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextField(
              controller: null,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintStyle: FutTheme.categoryFont,
                hintText: " Search for event",
              ),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? h * 0.72
                  : h * 0.35,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Color.fromARGB(255, 23, 22, 22)),
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    trailing: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color.fromRGBO(222, 253, 114, 1),
                    ),
                    title: Text(
                      "Logo Designing",
                      style: FutTheme.categoryFont,
                    ),
                    children: <Widget>[
                      SizedBox(
                        height: h * 0.4,
                        child: Stack(
                          fit: StackFit.expand,
                          children: const [
                            Align(
                              alignment: Alignment(-1, 0),
                              child: StackItem(
                                number: 2,
                              ),
                            ),
                            Align(
                              alignment: Alignment(0, -0.4),
                              child: StackItem(large: true),
                            ),
                            Align(
                              alignment: Alignment(1, 0),
                              child: StackItem(
                                number: 3,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(
            child: Text(
              'LEADERBOARD',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: w * 0.064),
            ),
          ),
          elevation: 0,
        ),
        //body: futureLeaderboard(height, context),
        body: Container(
          height: height,
          width: w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 0.5,
                  image: Themes().backgroundImage)),
          child: Center(
            child: Container(
              margin: EdgeInsets.only(
                left: 30,
                right: 30,
                top: height * 0.03,
                bottom: height * 0.1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: context.theme.cardColor,
              ),
              child: Center(
                child: Text(
                  "Leaderboard will be active soon ;)",
                  style: context.theme.textTheme.bodyMedium
                      ?.copyWith(color: context.theme.disabledColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StackItem extends StatelessWidget {
  const StackItem({super.key, this.large = false, this.number = 1});
  final bool large;
  final num number;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: large ? 90 : 70.0,
          height: large ? 90 : 70.0,
          child: Stack(
            children: [
              ClipPolygon(
                borderRadius: 8.0,
                sides: 6,
                child: Container(
                  color: const Color.fromARGB(255, 248, 247, 247),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipPolygon(
                      borderRadius: 8.0,
                      sides: 6,
                      child: CircularProfileAvatar(
                        'https://avatars3.githubusercontent.com/u/8264639?s=460&v=4',
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.9, -0.9),
                child: Container(
                  width: 26.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 58, 23, 118),
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text('$number', style: FutTheme.categoryFont)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          'Contestant',
          style: FutTheme.categoryFont,
        ),
        Text(
          '200 pts',
          style: FutTheme.categoryFont,
        )
      ],
    );
  }
}
