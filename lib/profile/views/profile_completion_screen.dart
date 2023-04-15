import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ProfileCompletion extends StatelessWidget {
  const ProfileCompletion({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _height = _size.height;
    final _width = _size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("PROFILE"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: _width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: CircleAvatar(
                radius: 40,
              ),
              backgroundColor: Colors.grey,
              radius: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone_outlined,
                  color: Colors.white,
                ),
                Text(
                  "00000000",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.mail_outline,
                  color: Colors.white,
                ),
                Text(
                  "email",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[800]),
              width: _width - 2 * (_width / 25),
              height: _height / 10,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Number of events registered",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next_outlined,
                      color: Colors.greenAccent,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_height / 25),
            ),
            Container(
              width: _width,
              height: _height / 2,
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[700],
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Edit Profile",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[700],
                          child: Icon(
                            Icons.document_scanner_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Certificates",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[700],
                          child: Icon(
                            Icons.perm_identity_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "ID Card",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[700],
                          child: Icon(
                            Icons.logout_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Logout",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
