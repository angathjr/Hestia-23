import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: h * 0.05,
                width: double.infinity,
              ),
              Text(
                "Schedule",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: h * 0.05,
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Dates(), Dates(), Dates()],
              ),
              SizedBox(
                height: h * 0.07,
                width: double.infinity,
              ),
              TimeLineofEvents(),
              TimeLineofEvents(),
              TimeLineofEvents(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: h * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home_outlined),
                color: Colors.white,
                disabledColor: Colors.grey,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.format_list_bulleted),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Full EventSchedule with Line and images
class TimeLineofEvents extends StatelessWidget {
  const TimeLineofEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTimeLine(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "12:00",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: h * 0.2,
                width: w * 0.6,
                child: Image(
                  image: AssetImage("assets/images/EventCategory1.png"),
                  fit: BoxFit.fill,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

//Conatiner for date box
class Dates extends StatelessWidget {
  const Dates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.09,
      width: w * 0.15,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "27",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "Feb",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

//Custom Line with circular end
class CustomTimeLine extends StatelessWidget {
  const CustomTimeLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.3,
      width: w * 0.2,
      child: CustomPaint(
        painter: LineCircle(),
      ),
    );
  }
}

class LineCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 3
      ..color = Colors.grey
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width / 2, size.height * 0.03), size.height * 0.03, paint);
    canvas.drawLine(Offset(size.width / 2, 2 * size.height * 0.01),
        Offset(size.width / 2, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
