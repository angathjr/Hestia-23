import 'package:flutter/material.dart';
import 'package:hestia_23/core/Constants..dart';

class ProfileView2 extends StatelessWidget {
  const ProfileView2({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final height = _size.height;
    final width = _size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Name"),
                  CircleAvatar(
                    radius: width * 0.1,
                    child: CircleAvatar(
                      radius: width * 0.08,
                      backgroundColor: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(width * 0.05),
              ),
              width: width * 0.8,
              height: height * 0.2,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      "Certificates",
                      style: FutTheme.font3.copyWith(fontSize: width * 0.06),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.1,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.05),
                    color: Colors.blueGrey,
                  ),
                  height: height * 0.27,
                  width: width * 0.35,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit_note_outlined,
                          size: width * 0.07,
                        ),
                        Text(
                          "Edit",
                          style:
                              FutTheme.font3.copyWith(fontSize: width * 0.04),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.05),
                    color: Colors.blueGrey,
                  ),
                  height: height * 0.27,
                  width: width * 0.4,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.perm_identity_outlined,
                        size: width * 0.07,
                      ),
                      Text(
                        "Id Card",
                        style: FutTheme.font3.copyWith(fontSize: width * 0.04),
                      ),
                    ],
                  )),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red[800],
                borderRadius: BorderRadius.circular(width * 0.05),
              ),
              width: width * 0.8,
              height: height * 0.1,
              child: Center(
                child: Text(
                  "Logout",
                  style: FutTheme.font3.copyWith(fontSize: width * 0.05),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
