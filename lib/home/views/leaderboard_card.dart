import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:get/get.dart';
import 'package:hestia_23/events/controllers/events_search_controller.dart';
import 'package:hestia_23/events/models/event.dart';
import 'package:hestia_23/theme/model/themes.dart';
import '../../core/constants..dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    var w = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: w,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              opacity: 0.25,
              image: Themes().backgroundImage)),
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                // backgroundColor: Colors.transparent,
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
              body: futureLeaderboard(height, context)),
        ),
      ),
    );
  }
}

class StackItem extends StatelessWidget {
  StackItem({super.key, this.large = false, this.number = 1, this.winner});
  final bool large;
  final num number;
  final Winner? winner;
  final EventsSearchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                        winner?.teamLeader?.profileImage ?? NOIMAGE,
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
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: width * 0.25,
          child: Text(
            "${winner?.teamLeader?.name}",
            style: FutTheme.categoryFont,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

Widget futureLeaderboard(num h, BuildContext context) {
  final EventsSearchController searchController = Get.find();

  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Container(
            alignment: Alignment.center,
            height: h * 0.06,
            decoration: BoxDecoration(
                color: const Color(0xff1E1E1E),
                borderRadius: BorderRadius.circular(20)),
            child: TextField(
              controller: searchController.editingController,
              textAlign: TextAlign.left,
              style: FutTheme.font3,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  prefixIcon: const Icon(FeatherIcons.search),
                  hintText: "Search events here",
                  hintStyle: context.theme.textTheme.bodyMedium
                      ?.copyWith(color: Colors.grey),
                  contentPadding: const EdgeInsets.only(left: 20),
                  border: InputBorder.none),
              onChanged: (_) => searchController.textFieldOnChanged(),
            ),
          ),
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Obx(
          () => searchController.eventsLoading.value
              ? SizedBox(height: h * 0.7, child: primaryLoadingWidget)
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? h * 0.72
                        : h * 0.35,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color.fromARGB(255, 23, 22, 22)),
                    child: ListView.builder(
                      itemCount: searchController.events.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ExpansionTile(
                          trailing: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                          ),
                          title: Text(
                            "${searchController.events[index].title}",
                            style: context.theme.textTheme.bodySmall?.copyWith(
                                fontSize: h * 0.022,
                                color: Colors.grey.shade400),
                          ),
                          children: <Widget>[
                            SizedBox(
                              height: h * 0.4,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Align(
                                    alignment: const Alignment(-0.8, 0),
                                    child: StackItem(
                                      number: 2,
                                      winner: searchController
                                          .events[index].winner2,
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(0, -0.5),
                                    child: StackItem(
                                      large: true,
                                      winner: searchController
                                          .events[index].winner1,
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(0.8, 0),
                                    child: StackItem(
                                      number: 3,
                                      winner: searchController
                                          .events[index].winner3,
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
                ),
        )
      ],
    ),
  );
}
