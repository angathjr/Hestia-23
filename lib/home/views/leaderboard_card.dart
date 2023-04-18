import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  // leaderboard widget-past theme
  Widget pastLeaderboard(num h, BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset('assets/images/past_lb.png')),
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            controller: null,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintStyle: const TextStyle(color: Colors.white),
              hintText: " Search for event",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? h * 0.4
                : h * 0.35,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromARGB(255, 23, 22, 22)),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.red,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Logo Designing",
                        style: TextStyle(color: Colors.white
                            //fontWeight: FontWeight.bold,
                            ),
                      ),
                    ));
              },
            ),
          ),
        )
      ],
    );
  }

  // leaderboard widget-present theme
  Widget presentLeaderboard(num h, BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset('assets/images/present_lb.png')),
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            controller: null,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintStyle: const TextStyle(color: Colors.white),
              hintText: " Search for event",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? h * 0.4
                : h * 0.35,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromARGB(255, 23, 22, 22)),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.yellow,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Logo Designing",
                        style: TextStyle(color: Colors.white),
                      ),
                    ));
              },
            ),
          ),
        )
      ],
    );
  }

  //leaderboard widget-future theme
 static Widget futureLeaderboard(num h, BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset('assets/images/future_lb.png')),
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            controller: null,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintStyle: const TextStyle(color: Colors.white),
              hintText: " Search for event",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? h * 0.4
                : h * 0.35,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromARGB(255, 23, 22, 22)),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.yellowAccent,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Logo Designing",
                        style: TextStyle(color: Colors.white
                            //fontWeight: FontWeight.bold,
                            ),
                      ),
                    ));
              },
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    return SafeArea(
      child: Scaffold(
        body: pastLeaderboard(height, context),
      ),
    );
  }
}
